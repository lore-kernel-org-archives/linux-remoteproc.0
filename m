Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Wed, 19 Feb 2020 08:09:21 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/9] dt-bindings: remoteproc: Convert imx-rproc to
 json-schema
Message-ID: <20200219140921.GA7031@bogus>
References: <1582097265-20170-1-git-send-email-peng.fan@nxp.com>
 <1582097265-20170-2-git-send-email-peng.fan@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1582097265-20170-2-git-send-email-peng.fan@nxp.com>
To: peng.fan@nxp.com
Cc: ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed, 19 Feb 2020 15:27:37 +0800, peng.fan@nxp.com wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Convert the i.MX remoteproc binding to DT schema format
> using json-schema
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  .../devicetree/bindings/remoteproc/imx-rproc.txt   | 33 ------------
>  .../devicetree/bindings/remoteproc/imx-rproc.yaml  | 61 ++++++++++++++++++++++
>  2 files changed, 61 insertions(+), 33 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/remoteproc/imx-rproc.txt
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/imx-rproc.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

warning: no schema found in file: Documentation/devicetree/bindings/remoteproc/imx-rproc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/remoteproc/imx-rproc.yaml: ignoring, error in schema: properties: clocks: items
Documentation/devicetree/bindings/display/simple-framebuffer.example.dts:21.16-37.11: Warning (chosen_node_is_root): /example-0/chosen: chosen node must be at root node
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/remoteproc/imx-rproc.yaml: properties:clocks:items: {'Clock for co-processor (See': '../clock/clock-bindings.txt)'} is not valid under any of the given schemas (Possible causes of the failure):
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/remoteproc/imx-rproc.yaml: properties:clocks:items: Additional properties are not allowed ('Clock for co-processor (See' was unexpected)

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/remoteproc/imx-rproc.yaml: properties:clocks: {'items': {'Clock for co-processor (See': '../clock/clock-bindings.txt)'}} is not valid under any of the given schemas (Possible causes of the failure):
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/remoteproc/imx-rproc.yaml: properties:clocks: 'maxItems' is a required property
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/remoteproc/imx-rproc.yaml: properties:clocks:items: {'Clock for co-processor (See': '../clock/clock-bindings.txt)'} is not valid under any of the given schemas (Possible causes of the failure):
		/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/remoteproc/imx-rproc.yaml: properties:clocks:items: {'Clock for co-processor (See': '../clock/clock-bindings.txt)'} is not of type 'array'


Documentation/devicetree/bindings/Makefile:12: recipe for target 'Documentation/devicetree/bindings/remoteproc/imx-rproc.example.dts' failed
make[1]: *** [Documentation/devicetree/bindings/remoteproc/imx-rproc.example.dts] Error 1
Makefile:1263: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1240544
Please check and re-submit.
