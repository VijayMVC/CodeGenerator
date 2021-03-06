﻿namespace QuantumConcepts.CodeGenerator.Client.UI.Forms
{
    partial class BatchEdit
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.label6 = new System.Windows.Forms.Label();
            this.valueXPathTextBox = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.elementTypeComboBox = new System.Windows.Forms.ComboBox();
            this.filterXPathTextBox = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label7 = new System.Windows.Forms.Label();
            this.label8 = new System.Windows.Forms.Label();
            this.updatePreviewButton = new System.Windows.Forms.Button();
            this.okButton = new System.Windows.Forms.Button();
            this.cancelButton = new System.Windows.Forms.Button();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.previewListView = new System.Windows.Forms.ListView();
            this.elementNameColumnHeader = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.valueColumnHeader = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.editorComboBox = new System.Windows.Forms.ComboBox();
            this.label4 = new System.Windows.Forms.Label();
            this.groupBox1.SuspendLayout();
            this.SuspendLayout();
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(98, 115);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(243, 13);
            this.label6.TabIndex = 32;
            this.label6.Text = "Multiple XPath queries are supported, for example:";
            // 
            // valueXPathTextBox
            // 
            this.valueXPathTextBox.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.valueXPathTextBox.Location = new System.Drawing.Point(101, 92);
            this.valueXPathTextBox.Name = "valueXPathTextBox";
            this.valueXPathTextBox.Size = new System.Drawing.Size(521, 20);
            this.valueXPathTextBox.TabIndex = 4;
            this.valueXPathTextBox.Click += new System.EventHandler(this.field_Changed);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(26, 95);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(69, 13);
            this.label3.TabIndex = 31;
            this.label3.Text = "Value XPath:";
            // 
            // elementTypeComboBox
            // 
            this.elementTypeComboBox.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.elementTypeComboBox.FormattingEnabled = true;
            this.elementTypeComboBox.Location = new System.Drawing.Point(101, 39);
            this.elementTypeComboBox.Name = "elementTypeComboBox";
            this.elementTypeComboBox.Size = new System.Drawing.Size(150, 21);
            this.elementTypeComboBox.TabIndex = 2;
            this.elementTypeComboBox.SelectedIndexChanged += new System.EventHandler(this.field_Changed);
            // 
            // filterXPathTextBox
            // 
            this.filterXPathTextBox.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.filterXPathTextBox.Location = new System.Drawing.Point(101, 66);
            this.filterXPathTextBox.Name = "filterXPathTextBox";
            this.filterXPathTextBox.Size = new System.Drawing.Size(521, 20);
            this.filterXPathTextBox.TabIndex = 3;
            this.filterXPathTextBox.Text = "@Exclude=\'false\'";
            this.filterXPathTextBox.Click += new System.EventHandler(this.field_Changed);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(20, 42);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(75, 13);
            this.label1.TabIndex = 30;
            this.label1.Text = "Element Type:";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(31, 69);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(64, 13);
            this.label2.TabIndex = 29;
            this.label2.Text = "Filter XPath:";
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(114, 131);
            this.label7.Name = "label7";
            this.label7.Padding = new System.Windows.Forms.Padding(12, 3, 0, 0);
            this.label7.Size = new System.Drawing.Size(81, 16);
            this.label7.TabIndex = 33;
            this.label7.Text = "Value XPath:";
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(201, 131);
            this.label8.Name = "label8";
            this.label8.Padding = new System.Windows.Forms.Padding(0, 3, 0, 0);
            this.label8.Size = new System.Drawing.Size(106, 16);
            this.label8.TabIndex = 34;
            this.label8.Text = "{@ClassName}Value";
            // 
            // updatePreviewButton
            // 
            this.updatePreviewButton.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.updatePreviewButton.Location = new System.Drawing.Point(12, 403);
            this.updatePreviewButton.Name = "updatePreviewButton";
            this.updatePreviewButton.Size = new System.Drawing.Size(100, 22);
            this.updatePreviewButton.TabIndex = 6;
            this.updatePreviewButton.Text = "&Update Preview";
            this.updatePreviewButton.UseVisualStyleBackColor = true;
            this.updatePreviewButton.Click += new System.EventHandler(this.updatePreviewButton_Click);
            // 
            // okButton
            // 
            this.okButton.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.okButton.Enabled = false;
            this.okButton.Location = new System.Drawing.Point(466, 402);
            this.okButton.Name = "okButton";
            this.okButton.Size = new System.Drawing.Size(75, 23);
            this.okButton.TabIndex = 7;
            this.okButton.Text = "&Ok";
            this.okButton.UseVisualStyleBackColor = true;
            this.okButton.Click += new System.EventHandler(this.okButton_Click);
            // 
            // cancelButton
            // 
            this.cancelButton.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.cancelButton.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.cancelButton.Location = new System.Drawing.Point(547, 402);
            this.cancelButton.Name = "cancelButton";
            this.cancelButton.Size = new System.Drawing.Size(75, 23);
            this.cancelButton.TabIndex = 8;
            this.cancelButton.Text = "&Cancel";
            this.cancelButton.UseVisualStyleBackColor = true;
            // 
            // groupBox1
            // 
            this.groupBox1.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.groupBox1.Controls.Add(this.previewListView);
            this.groupBox1.Location = new System.Drawing.Point(12, 150);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(610, 246);
            this.groupBox1.TabIndex = 5;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Preview";
            // 
            // previewListView
            // 
            this.previewListView.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.elementNameColumnHeader,
            this.valueColumnHeader});
            this.previewListView.Dock = System.Windows.Forms.DockStyle.Fill;
            this.previewListView.FullRowSelect = true;
            this.previewListView.Location = new System.Drawing.Point(3, 16);
            this.previewListView.Name = "previewListView";
            this.previewListView.Size = new System.Drawing.Size(604, 227);
            this.previewListView.TabIndex = 0;
            this.previewListView.TabStop = false;
            this.previewListView.UseCompatibleStateImageBehavior = false;
            this.previewListView.View = System.Windows.Forms.View.Details;
            // 
            // elementNameColumnHeader
            // 
            this.elementNameColumnHeader.Text = "ElementName";
            this.elementNameColumnHeader.Width = 269;
            // 
            // valueColumnHeader
            // 
            this.valueColumnHeader.Text = "Value";
            this.valueColumnHeader.Width = 299;
            // 
            // editorComboBox
            // 
            this.editorComboBox.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.editorComboBox.FormattingEnabled = true;
            this.editorComboBox.Location = new System.Drawing.Point(101, 12);
            this.editorComboBox.Name = "editorComboBox";
            this.editorComboBox.Size = new System.Drawing.Size(521, 21);
            this.editorComboBox.TabIndex = 39;
            this.editorComboBox.SelectedIndexChanged += new System.EventHandler(this.editorComboBox_SelectedIndexChanged);
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(58, 15);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(37, 13);
            this.label4.TabIndex = 40;
            this.label4.Text = "Editor:";
            // 
            // BatchEdit
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(634, 437);
            this.Controls.Add(this.editorComboBox);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.updatePreviewButton);
            this.Controls.Add(this.okButton);
            this.Controls.Add(this.cancelButton);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.label8);
            this.Controls.Add(this.label7);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.valueXPathTextBox);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.elementTypeComboBox);
            this.Controls.Add(this.filterXPathTextBox);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.label2);
            this.Name = "BatchEdit";
            this.ShowInTaskbar = false;
            this.Text = "Batch Edit";
            this.groupBox1.ResumeLayout(false);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.TextBox valueXPathTextBox;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.ComboBox elementTypeComboBox;
        private System.Windows.Forms.TextBox filterXPathTextBox;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.Button updatePreviewButton;
        private System.Windows.Forms.Button okButton;
        private System.Windows.Forms.Button cancelButton;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.ListView previewListView;
        private System.Windows.Forms.ColumnHeader elementNameColumnHeader;
        private System.Windows.Forms.ColumnHeader valueColumnHeader;
        private System.Windows.Forms.ComboBox editorComboBox;
        private System.Windows.Forms.Label label4;

    }
}