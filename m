Return-Path: <peng.fan@nxp.com>
From: Peng Fan <peng.fan@nxp.com>
Subject: RE: [PATCH 1/9] dt-bindings: remoteproc: Convert imx-rproc to
 json-schema
Date: Wed, 19 Feb 2020 14:34:32 +0000
Message-ID: 
 <AM0PR04MB44814713955807D7BB3E2CD088100@AM0PR04MB4481.eurprd04.prod.outlook.com>
References: <1582097265-20170-1-git-send-email-peng.fan@nxp.com>
 <1582097265-20170-2-git-send-email-peng.fan@nxp.com>
 <20200219140921.GA7031@bogus>
In-Reply-To: <20200219140921.GA7031@bogus>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Rob Herring <robh@kernel.org>
Cc: "ohad@wizery.com" <ohad@wizery.com>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Rob,

> Subject: Re: [PATCH 1/9] dt-bindings: remoteproc: Convert imx-rproc to
> json-schema
>=20
> On Wed, 19 Feb 2020 15:27:37 +0800, peng.fan@nxp.com wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> >
> > Convert the i.MX remoteproc binding to DT schema format using
> > json-schema
> >
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > ---
> >  .../devicetree/bindings/remoteproc/imx-rproc.txt   | 33 ------------
> >  .../devicetree/bindings/remoteproc/imx-rproc.yaml  | 61
> > ++++++++++++++++++++++
> >  2 files changed, 61 insertions(+), 33 deletions(-)  delete mode
> > 100644 Documentation/devicetree/bindings/remoteproc/imx-rproc.txt
> >  create mode 100644
> > Documentation/devicetree/bindings/remoteproc/imx-rproc.yaml
> >
>=20
> My bot found errors running 'make dt_binding_check' on your patch:

My command:
make dt_binding_check DT_SCHEMA_FILES=3DDocumentation/devicetree/bindings/r=
emoteproc/imx-rproc.yaml

and output:

  CHKDT   Documentation/devicetree/bindings/remoteproc/imx-rproc.yaml
  SCHEMA  Documentation/devicetree/bindings/processed-schema.yaml
  DTC     Documentation/devicetree/bindings/remoteproc/imx-rproc.example.dt=
.yaml
  CHECK   Documentation/devicetree/bindings/remoteproc/imx-rproc.example.dt=
.yaml

>=20
> warning: no schema found in file:
> Documentation/devicetree/bindings/remoteproc/imx-rproc.yaml
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/rem
> oteproc/imx-rproc.yaml: ignoring, error in schema: properties: clocks: it=
ems
> Documentation/devicetree/bindings/display/simple-framebuffer.example.dts:
> 21.16-37.11: Warning (chosen_node_is_root): /example-0/chosen: chosen
> node must be at root node
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/rem
> oteproc/imx-rproc.yaml: properties:clocks:items: {'Clock for co-processor
> (See': '../clock/clock-bindings.txt)'} is not valid under any of the give=
n
> schemas (Possible causes of the failure):
> 	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/
> remoteproc/imx-rproc.yaml: properties:clocks:items: Additional properties
> are not allowed ('Clock for co-processor (See' was unexpected)
>=20
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/rem
> oteproc/imx-rproc.yaml: properties:clocks: {'items': {'Clock for co-proce=
ssor
> (See': '../clock/clock-bindings.txt)'}} is not valid under any of the giv=
en
> schemas (Possible causes of the failure):
> 	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/
> remoteproc/imx-rproc.yaml: properties:clocks: 'maxItems' is a required
> property
> 	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/
> remoteproc/imx-rproc.yaml: properties:clocks:items: {'Clock for co-proces=
sor
> (See': '../clock/clock-bindings.txt)'} is not valid under any of the give=
n
> schemas (Possible causes of the failure):
>=20
> 	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/
> remoteproc/imx-rproc.yaml: properties:clocks:items: {'Clock for co-proces=
sor
> (See': '../clock/clock-bindings.txt)'} is not of type 'array'
>=20
>=20
> Documentation/devicetree/bindings/Makefile:12: recipe for target
> 'Documentation/devicetree/bindings/remoteproc/imx-rproc.example.dts'
> failed
> make[1]: ***
> [Documentation/devicetree/bindings/remoteproc/imx-rproc.example.dts]
> Error 1
> Makefile:1263: recipe for target 'dt_binding_check' failed
> make: *** [dt_binding_check] Error 2

I'll check, and after get comments for other patches will send out v2.

Thanks,
Peng.

>=20
> See
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fpatch
> work.ozlabs.org%2Fpatch%2F1240544&amp;data=3D02%7C01%7Cpeng.fan%40
> nxp.com%7C28b6280f1e8d4cd48fff08d7b5455348%7C686ea1d3bc2b4c6fa92
> cd99c5c301635%7C0%7C0%7C637177181663776763&amp;sdata=3DXfOrYdrVi
> qB4jwZRjPFLM82Zz5BjTZQF7gNohDOcOCw%3D&amp;reserved=3D0
> Please check and re-submit.
