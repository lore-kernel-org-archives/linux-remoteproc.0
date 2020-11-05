Return-Path: <SRS0=+gsc=EL=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46FA0C5517A
	for <linux-remoteproc@archiver.kernel.org>; Thu,  5 Nov 2020 19:42:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C8B1220704
	for <linux-remoteproc@archiver.kernel.org>; Thu,  5 Nov 2020 19:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604605338;
	bh=2f8uBDBd6vZ1Bi+z6mfdu/D7TFmbVBfMJ95MTlLW1M0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=vFSu6mFimjvpC1GkcNGyPt4wkf8I/S04GDJrQHA623LfoaFFC3+qiwkm5tYO2TdJZ
	 7mfdyy0i4Nmk8uIx8oPbLN0eAggAYbuSlRRJziQq4tWpOqhlAWE46YDnyQa8OmfXCI
	 0XkayDUq6IgVo+zTrmHPH/yLGTNgrKA0xgldkqOg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731060AbgKETmP (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 5 Nov 2020 14:42:15 -0500
Received: from mail.kernel.org ([198.145.29.99]:49508 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731740AbgKETmO (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 5 Nov 2020 14:42:14 -0500
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5387820936;
        Thu,  5 Nov 2020 19:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604605333;
        bh=2f8uBDBd6vZ1Bi+z6mfdu/D7TFmbVBfMJ95MTlLW1M0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=mQy6h2uw/FOfqG3jyuJJ0aIBcbjDQD9uwYzHzFpYvQ9QUBDBcIb+nl32FahOi0r//
         TxiWznPhi/PuNKfqYXqiP8n3W7yZw9yKQof72L2eLa8SG5zMyHPkuJ9w2UuC5k51Az
         eWWlonNS/Yo4HCK5uM4DY4bLJPMImlSrlLx/biAs=
Received: by mail-ot1-f50.google.com with SMTP id 79so2538388otc.7;
        Thu, 05 Nov 2020 11:42:13 -0800 (PST)
X-Gm-Message-State: AOAM533WGcMHxSfkZrIxS7gKZKbp0XR+E1vru5fBa1P/YgoNp4Q4Q8OE
        FbiBUE0rSYQJMi21Y5WCnOByx7DyxLBbPlYFOw==
X-Google-Smtp-Source: ABdhPJy+z0PQIDRqCFUJ6autn65Xzx2Zcq1tqbTGIqs3u22M5W508faJrZaTDa86EG65WOHy4dXQ/zi8XYANvzKPXck=
X-Received: by 2002:a9d:5e14:: with SMTP id d20mr2606861oti.107.1604605332504;
 Thu, 05 Nov 2020 11:42:12 -0800 (PST)
MIME-Version: 1.0
References: <20200922223930.4710-1-ben.levinsky@xilinx.com>
 <20200922223930.4710-5-ben.levinsky@xilinx.com> <20200929183601.GA892636@bogus>
 <BYAPR02MB44075C92FA8F400A5A6391E4B5330@BYAPR02MB4407.namprd02.prod.outlook.com>
In-Reply-To: <BYAPR02MB44075C92FA8F400A5A6391E4B5330@BYAPR02MB4407.namprd02.prod.outlook.com>
From:   Rob Herring <robh@kernel.org>
Date:   Thu, 5 Nov 2020 13:42:01 -0600
X-Gmail-Original-Message-ID: <CAL_JsqK8Z32ghxq+1o0nbNLWdQVaP+uBw4+1EyrY9qV4qX22Cg@mail.gmail.com>
Message-ID: <CAL_JsqK8Z32ghxq+1o0nbNLWdQVaP+uBw4+1EyrY9qV4qX22Cg@mail.gmail.com>
Subject: Re: [PATCH v16 4/5] dt-bindings: remoteproc: Add documentation for
 ZynqMP R5 rproc bindings
To:     Ben Levinsky <BLEVINSK@xilinx.com>
Cc:     Stefano Stabellini <stefanos@xilinx.com>,
        Michal Simek <michals@xilinx.com>,
        "michael.auchter@ni.com" <michael.auchter@ni.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "mathieu.poirier@linaro.org" <mathieu.poirier@linaro.org>,
        "Ed T. Mooring" <emooring@xilinx.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>, Jason Wu <j.wu@xilinx.com>,
        Jiaying Liang <jliang@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Sep 30, 2020 at 11:21 AM Ben Levinsky <BLEVINSK@xilinx.com> wrote:
>
> Hi Rob,
>
> > -----Original Message-----
> > From: Rob Herring <robh@kernel.org>
> > Sent: Tuesday, September 29, 2020 11:36 AM
> > To: Ben Levinsky <BLEVINSK@xilinx.com>
> > Cc: Stefano Stabellini <stefanos@xilinx.com>; Michal Simek
> > <michals@xilinx.com>; michael.auchter@ni.com; devicetree@vger.kernel.or=
g;
> > mathieu.poirier@linaro.org; Ed T. Mooring <emooring@xilinx.com>; linux-
> > remoteproc@vger.kernel.org; linux-kernel@vger.kernel.org; linux-arm-
> > kernel@lists.infradead.org; Jason Wu <j.wu@xilinx.com>; Jiaying Liang
> > <jliang@xilinx.com>; Michal Simek <michals@xilinx.com>
> > Subject: Re: [PATCH v16 4/5] dt-bindings: remoteproc: Add documentation=
 for
> > ZynqMP R5 rproc bindings
> >
> > On Tue, Sep 22, 2020 at 03:39:29PM -0700, Ben Levinsky wrote:
> > > Add binding for ZynqMP R5 OpenAMP.
> > >
> > > Represent the RPU domain resources in one device node. Each RPU
> > > processor is a subnode of the top RPU domain node.
> > >
> > > Signed-off-by: Jason Wu <j.wu@xilinx.com>
> > > Signed-off-by: Wendy Liang <jliang@xilinx.com>
> > > Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> > > Signed-off-by: Ben Levinsky <ben.levinsky@xilinx.com>
> > > ---
> > > v3:
> > > - update zynqmp_r5 yaml parsing to not raise warnings for extra
> > >   information in children of R5 node. The warning "node has a unit
> > >   name, but no reg or ranges property" will still be raised though
> > >   as this particular node is needed to describe the
> > >   '#address-cells' and '#size-cells' information.
> > > v4::
> > > - remove warning '/example-0/rpu@ff9a0000/r5@0:
> > >   node has a unit name, but no reg or ranges property'
> > >   by adding reg to r5 node.
> > > v5:
> > > - update device tree sample and yaml parsing to not raise any warning=
s
> > > - description for memory-region in yaml parsing
> > > - compatible string in yaml parsing for TCM
> > > v6:
> > > - remove coupling TCM nodes with remoteproc
> > > - remove mailbox as it is optional not needed
> > > v7:
> > > - change lockstep-mode to xlnx,cluster-mode
> > > v9:
> > > - show example IPC nodes and tcm bank nodes
> > > v11:
> > > - add property meta-memory-regions to illustrate link
> > >   between r5 and TCM banks
> > > - update so no warnings from 'make dt_binding_check'
> > > v14:
> > > - concerns were raised about the new property meta-memory-regions.
> > >   There is no clear direction so for the moment I kept it in the seri=
es
> > > - place IPC nodes in RAM in the reserved memory section
> > > v15:
> > > - change lockstep-mode prop as follows: if present, then RPU cluster =
is in
> > >   lockstep mode. if not present, cluster is in split mode.
> > > ---
> > >  .../xilinx,zynqmp-r5-remoteproc.yaml          | 120 ++++++++++++++++=
++
> > >  1 file changed, 120 insertions(+)
> > >  create mode 100644
> > Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-
> > remoteproc.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/remoteproc/xilinx,zynq=
mp-
> > r5-remoteproc.yaml
> > b/Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-
> > remoteproc.yaml
> > > new file mode 100644
> > > index 000000000000..ce02e425692e
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-
> > remoteproc.yaml
> > > @@ -0,0 +1,120 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: "http://devicetree.org/schemas/remoteproc/xilinx,zynqmp-r5-
> > remoteproc.yaml#"
> > > +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> > > +
> > > +title: Xilinx R5 remote processor controller bindings
> > > +
> > > +description:
> > > +  This document defines the binding for the remoteproc component tha=
t
> > loads and
> > > +  boots firmwares on the Xilinx Zynqmp and Versal family chipset.
> > > +
> > > +  Note that the Linux has global addressing view of the R5-related m=
emory
> > (TCM)
> > > +  so the absolute address ranges are provided in TCM reg's.
> >
> > blank line needed.
> >
> will fix in next rev.
> > TCMs specifically I'm concerned about how they are represented in syste=
m
> > DT and here...
> >
> So System DT can tie in with lopper plugin/assists so that TCMs are outpu=
t to whatever the linux driver expects.

Sorry, I don't buy lopper can handle it. That leaves too much hand waving I=
MO.

> > > +maintainers:
> > > +  - Ed Mooring <ed.mooring@xilinx.com>
> > > +  - Ben Levinsky <ben.levinsky@xilinx.com>
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: "xlnx,zynqmp-r5-remoteproc-1.0"
> >
> > Don't need quotes.
> >
> will fix in next rev.
> > The use of version numbers was allowed for Xilinx programmable IP. I
> > don't think this falls into that category.
> >
> will fix in next rev.
> > > +
> > > +  lockstep-mode:
> > > +    description:
> > > +      If this property is present, then the configuration is lock-st=
ep.
> >
> > boolean...
> >
> By this comment do you mean you want this to change or mention that it is=
 implicitly Boolean?

You defining this as a boolean and then using a schema that applies to
arrays (maxItems).

> > > +      Otherwise RPU is split.
> > > +    maxItems: 1
> >
> > ...or an array?
> >
> > Either way, doesn't work for TI R5.
> >
> So as the configuration for both the TI R5 and Xilinx R5 is independent w=
hat in common would you like to see here?
> For example Xilinx driver can similarly have the "Xilinx,cluster-mode" or=
 "cluster-mode" but for Xilinx platform manager our split configuration val=
ue in Xilinx platform manager is '0' while in TI drver it is '1'. So I can =
make the driver expect it then translate if needed if this what you prefer.

What's Xilinx platform manager? The drivers are irrelevant for the binding.

>
> Otherwise how would  you suggest the Xilinx r5 remoteproc driver describe=
 split/lockstep mode?

For what's clearly the same functionality, I want the binding the
same. TI can have more modes if that's what they need.

> > > +
> > > +  interrupts:
> > > +    description:
> > > +      Interrupt mapping for remoteproc IPI. It is required if the
> > > +      user uses the remoteproc driver with the RPMsg kernel driver.
> > > +    maxItems: 6
> > > +
> > > +  memory-region:
> > > +    description:
> > > +      collection of memory carveouts used for elf-loading and inter-=
processor
> > > +      communication.
> > > +    maxItems: 4
> > > +    minItems: 4
> >
> > Need to define what each region is.
> >
> > One blank line between properties.
> >
> will fix in next rev. for memory-regions is the following ok?
>       collection of phandles for memory carveouts for elf-loading and
>        inter-processor communication.
>
>        This collection can consist of reserved-mem carveouts in DDR.

No.

items:
  - description: This is the 1st entry...
  - description: This is the 2nd entry...
  ...

>
> > > +  meta-memory-regions:
> > > +    description:
> > > +      collection of memories that are not present in the top level m=
emory
> > > +      nodes' mapping. For example, R5s' TCM banks. These banks are n=
eeded
> > > +      for R5 firmware meta data such as the R5 firmware's heap and s=
tack
> >
> > Humm, needs a better explanation.
> How is the following:
> Collection of phandles for reserved on-chip SRAM regions.
>
>
> Otherwise I can get rid of this property and combine into memory-region i=
f you wish.

Not sure really.

> > > +  pnode-id:
> > > +    maxItems: 1
> >
> > What's this?
> >
> Can add the following:
> power node id that is used to uniquely identify the RPU for Xilinx
>       Power Management. The value is then passed to Xilinx platform
>       manager for power on/off and access.

Sounds like you should be using the power-domain binding.

> > > +  mboxes:
> > > +    maxItems: 2
> >
> > Need to define what each one is.
> >
> How is the following:
> array of phandles that describe the rx and tx for xilinx zynqmp
>       mailbox driver. order of rx and tx is described by the mbox-names
>       property. This will be used for communication with remote
>       processor.
> > > +  mbox-names:
> > > +    maxItems: 2
> >
> > Need to define the names.
> >
> How is the following:
> array of strings that denote which item in the mboxes property array
>       are the rx and tx for xilinx zynqmp mailbox driver

Terrible. We have a schema to define constraints.

items:
  - const: rx
  - const: tx


> > > +
> > > +examples:
> > > +  - |
> > > +     reserved-memory {
> > > +          #address-cells =3D <1>;
> > > +          #size-cells =3D <1>;
> > > +          ranges;
> > > +          elf_load: rproc@3ed000000 {
> > > +               no-map;
> > > +               reg =3D <0x3ed00000 0x40000>;
> > > +          };
> > > +
> > > +          rpu0vdev0vring0: rpu0vdev0vring0@3ed40000 {
> > > +               no-map;
> > > +               reg =3D <0x3ed40000 0x4000>;
> > > +          };
> > > +          rpu0vdev0vring1: rpu0vdev0vring1@3ed44000 {
> > > +               no-map;
> > > +               reg =3D <0x3ed44000 0x4000>;
> > > +          };
> > > +          rpu0vdev0buffer: rpu0vdev0buffer@3ed48000 {
> > > +               no-map;
> > > +               reg =3D <0x3ed48000 0x100000>;
> > > +          };
> > > +
> > > +     };
> > > +
> > > +     /*
> > > +      * Below nodes are required if using TCM to load R5 firmware
> > > +      * if not, then either do not provide nodes are label as disabl=
ed in
> > > +      * status property
> > > +      */
> > > +     tcm0a: tcm_0a@ffe00000 {
> > > +         reg =3D <0xffe00000 0x10000>;
> > > +         pnode-id =3D <0xf>;
> > > +         no-map;
> > > +         status =3D "okay";
> > > +         phandle =3D <0x40>;
> > > +         compatible =3D "xlnx,tcm";
> >
> > TCM is a Xilinx specific thing?
> >
> No... good point. Can remove the compatible string in next rev.

Well, it should probably have some sort of compatible so we know what
the thing is...

If we have a DT for the R5 side or view of the system, we'd need to
define TCMs, right? For the A cores, it shouldn't look any different
other than perhaps the address. So, you first need a TCM binding.
Maybe that ends up being just mmio-sram binding, maybe not. Probably
not if there's power controls.

> > > +     };
> > > +     tcm0b: tcm_1a@ffe20000 {
> > > +         reg =3D <0xffe20000 0x10000>;
> > > +         pnode-id =3D <0x10>;
> > > +         no-map;
> > > +         status =3D "okay";
> > > +         compatible =3D "xlnx,tcm";
> > > +         phandle =3D <0x41>;
> > > +     };
> > > +
> > > +     rpu {
> > > +          compatible =3D "xlnx,zynqmp-r5-remoteproc-1.0";
> > > +          #address-cells =3D <1>;
> > > +          #size-cells =3D <1>;
> > > +          ranges;
> > > +          lockstep-mode;
> > > +          r5_0 {
> > > +               ranges;
> > > +               #address-cells =3D <1>;
> > > +               #size-cells =3D <1>;
> > > +               memory-region =3D <&elf_load>,
> > > +                               <&rpu0vdev0vring0>,
> > > +                               <&rpu0vdev0vring1>,
> > > +                               <&rpu0vdev0buffer>;
> > > +               meta-memory-regions =3D <&tcm_0a>, <&tcm_0b>;
> > > +               pnode-id =3D <0x7>;
> > > +          };
> > > +     };
> > > +
> > > +...
> > > --
> > > 2.17.1
> > >
> Thank you,
> Ben
>
>
