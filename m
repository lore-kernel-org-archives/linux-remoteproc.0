Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Fri, 17 Apr 2020 11:13:50 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 4/5] dt-bindings: remoteproc: Add documentation for
 ZynqMP R5 rproc bindings
Message-ID: <20200417161350.GA24618@bogus>
References: <1587074082-14836-1-git-send-email-ben.levinsky@xilinx.com>
 <1587074082-14836-5-git-send-email-ben.levinsky@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1587074082-14836-5-git-send-email-ben.levinsky@xilinx.com>
To: Ben Levinsky <ben.levinsky@xilinx.com>
Cc: ohad@wizery.com, bjorn.andersson@linaro.org, michal.simek@xilinx.com, jollys@xilinx.com, rajan.vaja@xilinx.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jason Wu <j.wu@xilinx.com>, Wendy Liang <jliang@xilinx.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu, 16 Apr 2020 14:54:41 -0700, Ben Levinsky wrote:
> Add binding for ZynqMP R5 OpenAMP.
> 
> Represent the RPU domain resources in one device node. Each RPU
> processor is a subnode of the top RPU domain node.
> 
> Signed-off-by: Ben Levinsky <ben.levinsky@xilinx.com>
> Signed-off-by: Jason Wu <j.wu@xilinx.com>
> Signed-off-by: Wendy Liang <jliang@xilinx.com>
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> ---
>  .../remoteproc/xilinx,zynqmp-r5-remoteproc.yaml    | 119 +++++++++++++++++++++
>  1 file changed, 119 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.example.dts:20.14-21: Warning (ranges_format): /example-0/reserved-memory:ranges: empty "ranges" property but its #address-cells (2) differs from /example-0 (1)
Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.example.dts:20.14-21: Warning (ranges_format): /example-0/reserved-memory:ranges: empty "ranges" property but its #size-cells (2) differs from /example-0 (1)
Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.example.dts:43.14-21: Warning (ranges_format): /example-0/zynqmp-rpu:ranges: empty "ranges" property but its #address-cells (2) differs from /example-0 (1)
Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.example.dts:43.14-21: Warning (ranges_format): /example-0/zynqmp-rpu:ranges: empty "ranges" property but its #size-cells (2) differs from /example-0 (1)
Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.example.dts:39.20-63.11: Warning (unit_address_vs_reg): /example-0/zynqmp-rpu: node has a reg or ranges property, but no unit name
Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.example.dts:46.25-62.16: Warning (unit_address_vs_reg): /example-0/zynqmp-rpu/r5@0: node has a unit name, but no reg or ranges property
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.example.dt.yaml: zynqmp-rpu: '#address-cells', '#size-cells', 'r5@0', 'ranges', 'reg' do not match any of the regexes: 'pinctrl-[0-9]+'

See https://patchwork.ozlabs.org/patch/1271919

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.
