﻿namespace QuantumConcepts.CodeGenerator.Client.UI.Controls
{
    partial class PackageInput
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

        #region Component Designer generated code

        /// <summary> 
        /// Required method for Designer support - do not modify 
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.textBox = new System.Windows.Forms.TextBox();
            this.label = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // textBox
            // 
            this.textBox.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.textBox.Location = new System.Drawing.Point(112, 0);
            this.textBox.Name = "textBox";
            this.textBox.Size = new System.Drawing.Size(338, 20);
            this.textBox.TabIndex = 1;
            // 
            // label
            // 
            this.label.Location = new System.Drawing.Point(-3, 3);
            this.label.Name = "label";
            this.label.Size = new System.Drawing.Size(109, 13);
            this.label.TabIndex = 8;
            this.label.Text = "[Label]:";
            this.label.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // PackageInput
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.label);
            this.Controls.Add(this.textBox);
            this.Name = "PackageInput";
            this.Size = new System.Drawing.Size(450, 20);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox textBox;
        private System.Windows.Forms.Label label;
    }
}
