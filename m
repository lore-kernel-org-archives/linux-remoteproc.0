Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Fri, 17 Aug 2018 09:09:48 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 7/7] Documentation: devicetree: Add Xilinx R5 rproc
 binding
Message-ID: <20180817150948.GA20845@rob-hp-laptop>
References: <1534403190-28523-1-git-send-email-jliang@xilinx.com>
 <1534403190-28523-8-git-send-email-jliang@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1534403190-28523-8-git-send-email-jliang@xilinx.com>
To: Wendy Liang <wendy.liang@xilinx.com>
Cc: ohad@wizery.com, bjorn.andersson@linaro.org, michal.simek@xilinx.com, robh+dt@kernel.org, mark.rutland@arm.com, rajan.vaja@xilinx.com, jollys@xilinx.com, linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Wendy Liang <jliang@xilinx.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi, this email is from Rob's (experimental) review bot. I found a couple
of common problems with your patch. Please see below.

On Thu, 16 Aug 2018 00:06:30 -0700, Wendy Liang wrote:
> Add device tree binding for Xilinx Cortex-r5 remoteproc.
> 
> Signed-off-by: Wendy Liang <jliang@xilinx.com>

The preferred subject prefix is "dt-bindings: <binding dir>: ...".

> ---
>  .../remoteproc/xlnx,zynqmp-r5-remoteproc.txt       | 81 ++++++++++++++++++++++
>  1 file changed, 81 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5-remoteproc.txt
> 
