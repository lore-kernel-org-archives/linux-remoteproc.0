Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:33250 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726823AbgBTAh7 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 19 Feb 2020 19:37:59 -0500
MIME-Version: 1.0
References: <1582097265-20170-1-git-send-email-peng.fan@nxp.com>
 <1582097265-20170-2-git-send-email-peng.fan@nxp.com> <20200219140921.GA7031@bogus>
 <AM0PR04MB44814713955807D7BB3E2CD088100@AM0PR04MB4481.eurprd04.prod.outlook.com>
In-Reply-To: <AM0PR04MB44814713955807D7BB3E2CD088100@AM0PR04MB4481.eurprd04.prod.outlook.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 19 Feb 2020 18:37:46 -0600
Message-ID: <CAL_JsqJWzax7eAc=qzWiSWtNtDuSyZ9OsnZ_rZNBSUgOQ7+fiQ@mail.gmail.com>
Subject: Re: [PATCH 1/9] dt-bindings: remoteproc: Convert imx-rproc to json-schema
Content-Type: text/plain; charset="UTF-8"
Sender: linux-remoteproc-owner@vger.kernel.org
To: Peng Fan <peng.fan@nxp.com>
Cc: "ohad@wizery.com" <ohad@wizery.com>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed, Feb 19, 2020 at 8:34 AM Peng Fan <peng.fan@nxp.com> wrote:
>
> Hi Rob,
>
> > Subject: Re: [PATCH 1/9] dt-bindings: remoteproc: Convert imx-rproc to
> > json-schema
> >
> > On Wed, 19 Feb 2020 15:27:37 +0800, peng.fan@nxp.com wrote:
> > > From: Peng Fan <peng.fan@nxp.com>
> > >
> > > Convert the i.MX remoteproc binding to DT schema format using
> > > json-schema
> > >
> > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > > ---
> > >  .../devicetree/bindings/remoteproc/imx-rproc.txt   | 33 ------------
> > >  .../devicetree/bindings/remoteproc/imx-rproc.yaml  | 61
> > > ++++++++++++++++++++++
> > >  2 files changed, 61 insertions(+), 33 deletions(-)  delete mode
> > > 100644 Documentation/devicetree/bindings/remoteproc/imx-rproc.txt
> > >  create mode 100644
> > > Documentation/devicetree/bindings/remoteproc/imx-rproc.yaml
> > >
> >
> > My bot found errors running 'make dt_binding_check' on your patch:
>
> My command:
> make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/remoteproc/imx-rproc.yaml
>
> and output:
>
>   CHKDT   Documentation/devicetree/bindings/remoteproc/imx-rproc.yaml
>   SCHEMA  Documentation/devicetree/bindings/processed-schema.yaml
>   DTC     Documentation/devicetree/bindings/remoteproc/imx-rproc.example.dt.yaml
>   CHECK   Documentation/devicetree/bindings/remoteproc/imx-rproc.example.dt.yaml

Make sure dtschema is up to date though I'm not sure this could have
ever passed. 'items' value is clearly wrong.

Rob
