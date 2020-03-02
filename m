Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Mon, 2 Mar 2020 14:27:30 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 4/5] dt-bindings: remoteproc: Add documentation for
 ZynqMP R5 rproc bindings
Message-ID: <20200302202730.GA4561@bogus>
References: <1582566751-13118-1-git-send-email-ben.levinsky@xilinx.com>
 <1582566751-13118-5-git-send-email-ben.levinsky@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1582566751-13118-5-git-send-email-ben.levinsky@xilinx.com>
To: Ben Levinsky <ben.levinsky@xilinx.com>
Cc: ohad@wizery.com, bjorn.andersson@linaro.org, michal.simek@xilinx.com, jollys@xilinx.com, rajan.vaja@xilinx.com, mark.rutland@arm.com, linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jason Wu <j.wu@xilinx.com>, Wendy Liang <jliang@xilinx.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon, Feb 24, 2020 at 09:52:30AM -0800, Ben Levinsky wrote:
> From: Jason Wu <j.wu@xilinx.com>
> 
> Add binding for ZynqMP R5 OpenAMP.
> 
> Represent the RPU domain resources in one device node. Each RPU
> processor is a subnode of the top RPU domain node.
> 
> Signed-off-by: Jason Wu <j.wu@xilinx.com>
> Signed-off-by: Wendy Liang <jliang@xilinx.com>
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> ---
>  .../remoteproc/xilinx,zynqmp-r5-remoteproc.txt     | 135 +++++++++++++++++++++
>  1 file changed, 135 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.txt

DT bindings have moved to DT schema format. See 
Documentation/devicetree/writing-schema.rst.

Rob
