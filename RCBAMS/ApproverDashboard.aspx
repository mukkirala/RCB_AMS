<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ApproverDashboard.aspx.cs" Inherits="ApproverDashboard" %>


<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" Runat="Server">

        <script type="text/javascript">
        function ShowLoginWindow1() {
            pcLogin.Show();
            return false;
        }
        </script>
    
    <!-- Chart.js Library -->
    <%--<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>--%>
    <script src="../offlinecss/chart.js"></script>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

    <style>
        /* Year Filter Styles */
        .year-filter {
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

            .year-filter .form-select {
                border: 1px solid #dee2e6;
                border-radius: 6px;
                font-size: 0.875rem;
                padding: 0.25rem 0.5rem;
            }

            .year-filter .form-label {
                font-size: 0.875rem;
                font-weight: 600;
                color: var(--dark-gray);
                margin-bottom: 0;
            }

        /* Loading state for chart */
        .chart-container.loading .chart-wrapper {
            opacity: 0.6;
            pointer-events: none;
        }

        .chart-container.loading::after {
            content: 'Loading...';
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            font-weight: 600;
            color: var(--primary-blue);
        }


        :root {
            --primary-pink: #F14F7C;
            --primary-blue: #03A9F4;
            --primary-green: #008000;
            --primary-orange: #FF9800;
            --primary-purple: #9C27B0;
            --primary-teal: #009688;
            --dark-gray: #2c3e50;
            --light-gray: #ecf0f1;
            --border-radius: 12px;
            --box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
            --transition: all 0.3s ease;
        }

        .dashboard-container {
            background: #f8f9fa;
            min-height: 100vh;
            padding: 20px 0;
        }

        .dashboard-header {
            background: white;
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
            padding: 1.5rem 2rem;
            margin-bottom: 2rem;
            border-left: 5px solid var(--primary-blue);
        }

        .dashboard-title {
            color: var(--dark-gray);
            font-weight: 700;
            margin: 0;
            font-size: 2.2rem;
        }

        .dashboard-subtitle {
            color: #7f8c8d;
            font-size: 1.1rem;
            margin: 0.5rem 0 0 0;
        }

        /* Enhanced Stat Cards */
        .stat-card {
            background: linear-gradient(135deg, #fff 0%, #f8f9fa 100%);
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
            border-left: 5px solid transparent;
            padding: 1.5rem;
            height: 160px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            transition: var(--transition);
            position: relative;
            overflow: hidden;
        }

            .stat-card::before {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                height: 4px;
                background: linear-gradient(90deg, transparent 0%, rgba(255,255,255,0.8) 100%);
            }

            .stat-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 8px 30px rgba(0, 0, 0, 0.12);
            }

        .stat-content {
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex: 1;
        }

        .stat-info {
            display: flex;
            flex-direction: column;
            flex: 1;
        }

        .stat-title {
            margin: 0;
            color: #666;
            font-size: 1.1rem;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .stat-value {
            margin: 0.5rem 0 0 0;
            font-size: 2.5rem;
            font-weight: 800;
            color: var(--dark-gray);
            line-height: 1;
        }

        .stat-description {
            margin: 0.25rem 0 0 0;
            color: #888;
            font-size: 0.9rem;
        }

        .stat-icon {
            background: rgba(0,0,0,0.04);
            padding: 1rem;
            border-radius: 50%;
            font-size: 2rem;
            width: 70px;
            height: 70px;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: var(--transition);
        }

        .stat-card:hover .stat-icon {
            transform: scale(1.1);
        }

        .stat-link {
            text-align: center;
            font-weight: 600;
            text-decoration: none;
            font-size: 0.9rem;
            padding: 0.5rem;
            border-radius: 6px;
            transition: var(--transition);
            margin-top: 0.5rem;
        }

            .stat-link:hover {
                background: rgba(0,0,0,0.05);
            }

        /* Color variants */
        .stat-pink {
            border-left-color: var(--primary-pink);
        }

        .stat-blue {
            border-left-color: var(--primary-blue);
        }

        .stat-green {
            border-left-color: var(--primary-green);
        }

        .stat-orange {
            border-left-color: var(--primary-orange);
        }

        .stat-purple {
            border-left-color: var(--primary-purple);
        }

        .stat-teal {
            border-left-color: var(--primary-teal);
        }

        .stat-pink .stat-icon {
            background: rgba(241, 79, 124, 0.1);
            color: var(--primary-pink);
        }

        .stat-blue .stat-icon {
            background: rgba(3, 169, 244, 0.1);
            color: var(--primary-blue);
        }

        .stat-green .stat-icon {
            background: rgba(0, 128, 0, 0.1);
            color: var(--primary-green);
        }

        .stat-orange .stat-icon {
            background: rgba(255, 152, 0, 0.1);
            color: var(--primary-orange);
        }

        .stat-purple .stat-icon {
            background: rgba(156, 39, 176, 0.1);
            color: var(--primary-purple);
        }

        .stat-teal .stat-icon {
            background: rgba(0, 150, 136, 0.1);
            color: var(--primary-teal);
        }

        /* Chart Styles */
        .chart-container {
            background: white;
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
            padding: 1.5rem;
            height: 400px;
            border: 1px solid #e9ecef;
            margin-bottom: 1.5rem; /* Space between charts in same row */
        }

        /* Responsive adjustments for chart grid */
        @media (max-width: 768px) {
            .chart-container {
                height: 350px;
                margin-bottom: 1rem;
            }

            .chart-wrapper {
                position: relative;
                height: 320px;
                width: 100%;
            }
        }

        /* Remove bottom margin from last chart in row */
        .row .mb-4:last-child .chart-container {
            margin-bottom: 0;
        }

        .chart-title {
            font-size: 1.3rem;
            font-weight: 700;
            margin-bottom: 1.5rem;
            color: var(--dark-gray);
            text-align: center;
            padding-bottom: 1rem;
            border-bottom: 2px solid var(--light-gray);
        }

        .chart-wrapper {
            position: relative;
            height: 320px;
            width: 100%;
        }

        /* Quick Actions */
        .quick-actions {
            background: white;
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
            padding: 1.5rem;
            margin-bottom: 2rem;
        }

        .actions-title {
            font-size: 1.3rem;
            font-weight: 700;
            margin-bottom: 1rem;
            color: var(--dark-gray);
        }

        .action-buttons {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 1rem;
        }

        .action-btn {
            background: linear-gradient(135deg, var(--primary-blue), #0288d1);
            color: white;
            border: none;
            padding: 1rem 1.5rem;
            border-radius: 8px;
            text-decoration: none;
            text-align: center;
            font-weight: 600;
            transition: var(--transition);
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
        }

            .action-btn:hover {
                transform: translateY(-2px);
                box-shadow: 0 5px 15px rgba(3, 169, 244, 0.3);
                color: white;
                text-decoration: none;
            }

            .action-btn.pink {
                background: linear-gradient(135deg, var(--primary-pink), #e91e63);
            }

            .action-btn.green {
                background: linear-gradient(135deg, var(--primary-green), #006400);
            }

            .action-btn.orange {
                background: linear-gradient(135deg, var(--primary-orange), #f57c00);
            }

        /* Requests Panel */
        .requests-panel {
            background: white;
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
            padding: 1.5rem;
            margin-bottom: 2rem;
        }

        .requests-title {
            font-size: 1.3rem;
            font-weight: 700;
            margin-bottom: 1rem;
            color: var(--dark-gray);
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .request-badge {
            background: var(--primary-pink);
            color: white;
            padding: 0.25rem 0.75rem;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 600;
        }

        .request-item {
            padding: 1rem;
            border-bottom: 1px solid #e9ecef;
            transition: var(--transition);
        }

            .request-item:hover {
                background: #f8f9fa;
            }

            .request-item:last-child {
                border-bottom: none;
            }

        .request-link {
            color: var(--dark-gray);
            text-decoration: none;
            font-weight: 500;
            display: block;
        }

            .request-link:hover {
                color: var(--primary-blue);
                text-decoration: none;
            }

        .request-date {
            color: #7f8c8d;
            font-size: 0.85rem;
            margin-top: 0.25rem;
        }

        /* Loading Animation */
        @keyframes pulse {
            0% {
                opacity: 1;
            }

            50% {
                opacity: 0.5;
            }

            100% {
                opacity: 1;
            }
        }

        .loading {
            animation: pulse 1.5s ease-in-out infinite;
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .chart-container {
                height: 350px;
                margin-bottom: 1rem;
            }
            /* Make sure rows have visible spacing */
            .row.mb-5 {
                margin-bottom: 2rem !important;
                border: 1px solid transparent; /* Debug - remove this line after testing */
            }

            /* Make sure the requests panel has top spacing */
            .col-12.mt-4 {
                margin-top: 2rem !important;
                border: 1px solid transparent; /* Debug - remove this line after testing */
            }

            .row.mb-5 {
                margin-bottom: 2rem !important;
            }

            .col-12.mt-4 {
                margin-top: 1.5rem !important;
            }



            .stat-value {
                font-size: 2rem;
            }

            .chart-container {
                height: 300px;
            }

            .chart-wrapper {
                position: relative;
                height: 320px;
                width: 100%;
            }

            .action-buttons {
                grid-template-columns: 1fr;
            }
        }

        .dashboard-row {
            margin-bottom: 2rem;
        }

        .auto-style35 {
            box-shadow: var(--box-shadow);
            margin-bottom: 2rem;
            padding: 1.5rem;
            background: white;
            border-radius: var(--border-radius);
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">

        <div class="dashboard-container">
        <div class="container">
                      <!-- Dashboard Title -->
<div class="row mb-4">
    <div class="col-12 text-center">
        <h1 class="dashboard-label" style="color: var(--dark-gray); font-weight: 700; font-size: 2.5rem; margin: 0; padding: 0.5rem 0;">DASHBOARD
        </h1>
    </div>
</div> 

                <!-- Pending Approvals Below Charts with proper spacing -->
                <div class="col-12 mt-4">
                    <!-- Added top margin to separate from charts -->
                    <div class="requests-panel">
                        <h3 class="requests-title">
                            <i class="fas fa-tasks me-2"></i>Pending Approvals
                <span class="request-badge" id="requestCount" runat="server">0</span>
                        </h3>
                        <div class="table-responsive">
                            <asp:Table ID="myTable" runat="server" Width="100%" CssClass="table">
                                <asp:TableRow>
                                </asp:TableRow>
                            </asp:Table>
                        </div>
                        <div id="noRequests" runat="server" class="text-center text-muted p-4" style="display: none;">
                            <i class="fas fa-check-circle fa-3x mb-3"></i>
                            <p>No pending requests</p>
                        </div>
                    </div>
                </div>
            </div>





        </div>

</asp:Content>


