Return-Path: <SRS0=H4uj=DH=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E471BC47426
	for <linux-remoteproc@archiver.kernel.org>; Wed, 30 Sep 2020 16:21:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7FC882072E
	for <linux-remoteproc@archiver.kernel.org>; Wed, 30 Sep 2020 16:21:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="A1TR4d2b"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731029AbgI3QVZ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 30 Sep 2020 12:21:25 -0400
Received: from mail-dm6nam11on2068.outbound.protection.outlook.com ([40.107.223.68]:54112
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726335AbgI3QVZ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 30 Sep 2020 12:21:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LPRZ8AiMAc8OEQH/Q7pJcmxlhDCsVN3/gMq/zQZDv/qfVtLmeB3zeL0VSdjZc7cHYusztHJ/gATJy3nhCsUaEVxoUpkhSxEl4Zb6lhmnvCvbSt9XF6Tc7NezVdRCLSBLm2BZdR1IthnG5arWvKAdFeyGQgxh9IVAWk/jkEqDcTCwRfQIEihD5CZtArBESqaZEMmFrFH1Rb9g8nlQV8v9a/ARPAPYzdqyOJ+kEV9IgmCmMeDpDSGUbUuEpTEi0uXsYrjiCKeWG9qXa7OfEputCHck6qUle2e26ynX7J55h83Pjl5ODaJHnwRx2ytVWaBkxn+/BcSdfI8WaM61nUCFag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xj3nanbdPfKnewmFgjLjCrh90Aed6zdyh+tbDz7Xn8s=;
 b=R/QfETKdiVYLu1h/v73jfMpsHCySzKNKY18HmZff9nykTFRmb+/4nY5A4AMFN+oUtVGFl7G8MnsOVKRMozjp3mg2qHj+gDsVyff2tY0slLSyL8GPkv6DJdrrvxnMlSGR0uaVU2frNTnv2N2UzQLhKbF0PAXnI8ZPmop4jRiqMCKJJRSZS0VR0itmk59VTJaZGDIpSEqeqTvO9FJPZOtgz8HgTaZIY9TJxF5CkMVQcIuhLqm/1BInlA2edFN2MIPkE9X9DTbdp12Xz1ya0vK32ikRhElwMurTnQtn85hUifs0pLtl4OVHPlyESMIClERJpo5gEgkfLl7x8rMa88GGlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xj3nanbdPfKnewmFgjLjCrh90Aed6zdyh+tbDz7Xn8s=;
 b=A1TR4d2bcuHxzB9nmoDrKuG/D+Y1raz1OwWlPTTAobvjXJmzIpjpk7/ocw5TovfzNWOk6gb68V/VQM0qFzZTDdt1SM+6e0FM5adUVxtdDrrZ0duK6l1bX++87wFbotFqW7ywSvoZ+1Bgszc+ehh510e+JNz7dxSC7JJ+crBQ2Dg=
Received: from BYAPR02MB4407.namprd02.prod.outlook.com (2603:10b6:a03:55::31)
 by BYAPR02MB5336.namprd02.prod.outlook.com (2603:10b6:a03:67::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.23; Wed, 30 Sep
 2020 16:21:20 +0000
Received: from BYAPR02MB4407.namprd02.prod.outlook.com
 ([fe80::113d:722:5f93:d29e]) by BYAPR02MB4407.namprd02.prod.outlook.com
 ([fe80::113d:722:5f93:d29e%6]) with mapi id 15.20.3412.028; Wed, 30 Sep 2020
 16:21:20 +0000
From:   Ben Levinsky <BLEVINSK@xilinx.com>
To:     Rob Herring <robh@kernel.org>
CC:     Stefano Stabellini <stefanos@xilinx.com>,
        Michal Simek <michals@xilinx.com>,
        "michael.auchter@ni.com" <michael.auchter@ni.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "mathieu.poirier@linaro.org" <mathieu.poirier@linaro.org>,
        "Ed T. Mooring" <emooring@xilinx.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>, Jason Wu <j.wu@xilinx.com>,
        Jiaying Liang <jliang@xilinx.com>,
        Michal Simek <michals@xilinx.com>
Subject: RE: [PATCH v16 4/5] dt-bindings: remoteproc: Add documentation for
 ZynqMP R5 rproc bindings
Thread-Topic: [PATCH v16 4/5] dt-bindings: remoteproc: Add documentation for
 ZynqMP R5 rproc bindings
Thread-Index: AQHWkTFLrK/9RT/jFk+PHOoE+6xBFKl//F+AgAFpQLA=
Date:   Wed, 30 Sep 2020 16:21:20 +0000
Message-ID: <BYAPR02MB44075C92FA8F400A5A6391E4B5330@BYAPR02MB4407.namprd02.prod.outlook.com>
References: <20200922223930.4710-1-ben.levinsky@xilinx.com>
 <20200922223930.4710-5-ben.levinsky@xilinx.com>
 <20200929183601.GA892636@bogus>
In-Reply-To: <20200929183601.GA892636@bogus>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=xilinx.com;
x-originating-ip: [149.199.62.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c392b583-c29a-4f7c-6f89-08d8655cddf1
x-ms-traffictypediagnostic: BYAPR02MB5336:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR02MB53360EF21B825E96C89D0105B5330@BYAPR02MB5336.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: F4htH+oTggMQzVXywo4/NgOOHWiQsRx3aCoH43toDVmLZZ1VmVn4v5E/WrupvbCXqEP7NtAVAwETE0pl2H6RgZReCNeTD1nRuQfvVVfmJNIQOvyF9jSyezYVYP9WaiIMzeDlNpAUwUDqJbzM305CjCptblJanLWw/GDE10SY6c2sW7tyO6fApgLRjNlM4u+Rxot/geuhVqjOe4KZcWuRSpyqYDQG7nWkea2/chB3t9eGNc1VO/1DthmqdjuDwVQ/kCoOL7ufpAHv+Rj6IiihZTZmGLsPhwDEP3B32wOifhbZh5hYJYu4FkQ3WEmOFv52maCZ3zJMD7TpKZvX2xF12mevBAJTUKyWH095KmC1FosImwFHJeXlYZSaAse5onNtOlYGpHQRRTNEXbl84nbQN3yS+Y8HjXsmOdAxMX9Rm9iMybkCzPb2dzQKFVugd92n
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR02MB4407.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(136003)(39860400002)(346002)(376002)(396003)(9686003)(52536014)(8936002)(66446008)(66556008)(66476007)(5660300002)(76116006)(66946007)(64756008)(55016002)(2906002)(83380400001)(4326008)(107886003)(6916009)(86362001)(8676002)(186003)(316002)(26005)(53546011)(6506007)(7696005)(33656002)(54906003)(478600001)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 3q0mj/4ov3FoCvqtyxgU7hAFsB2K7AitBf5DcMZKanzJtWqXJyV/jn+/j4cRA2SxFkLltf//piJmGmkStdzaoEfJWyorzbnTFCpnqCU70gGr1W7xWL0q903uTINHfqXbeFt6Qw83h40qfiZQE6q6iO3RUvMqD7fehsOqn6LcgIKSdsO9IhmssAtwM4IAN+g9sE19KS5uY9EsosFtuKEKv+VIkbDC1syAtx+/ytvS+89d6aDCddgtM8ZZ5oRl2AIS8Esn4cSll+NbMsa0K4xKld9i/Ow6n5lDjChKSi6z6hWUmWCzdzYBBgnolZ8n9YHOYeATiItRO8GTNjW6lguR0WOOn1slzwcwFNzwt/t6J4MxR/lA0rM7HaGoldNcdYhGmiT/U24hKgzManA8cqJwREH4aKaelrxD7RW+ckTooIeoQpa65fXUd8AehWnTR0nxz+ZLQbs+M6+UIAVbE2fRvqsINl+EigsBi0w7CtmROJUPsH8Bn6epqAquRQsf/8UtR2+TBMymc0SQApRf/OfGccC7yLJ9FZthIUEK+gnl3q4lha26NIzyGWcvN7214eH1uJoxn7X6ZXFmbfVGJo9MD4DCykqKnHfBVzV33cdoWatNxtR2aG5PADwfOsoqyQDTuHU7IDomx0X6W0m6eBlm5Q==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4407.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c392b583-c29a-4f7c-6f89-08d8655cddf1
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2020 16:21:20.6520
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: maA/xpc3ig7oelb48r4bqV90y9YA1CKDe5GVKltOn51DBqmKdcYS/yJnJQw7Ebr+x8hQNnmHYZOvkjRzBzzVSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5336
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Rob,

> -----Original Message-----
> From: Rob Herring <robh@kernel.org>
> Sent: Tuesday, September 29, 2020 11:36 AM
> To: Ben Levinsky <BLEVINSK@xilinx.com>
> Cc: Stefano Stabellini <stefanos@xilinx.com>; Michal Simek
> <michals@xilinx.com>; michael.auchter@ni.com; devicetree@vger.kernel.org;
> mathieu.poirier@linaro.org; Ed T. Mooring <emooring@xilinx.com>; linux-
> remoteproc@vger.kernel.org; linux-kernel@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org; Jason Wu <j.wu@xilinx.com>; Jiaying Liang
> <jliang@xilinx.com>; Michal Simek <michals@xilinx.com>
> Subject: Re: [PATCH v16 4/5] dt-bindings: remoteproc: Add documentation f=
or
> ZynqMP R5 rproc bindings
>=20
> On Tue, Sep 22, 2020 at 03:39:29PM -0700, Ben Levinsky wrote:
> > Add binding for ZynqMP R5 OpenAMP.
> >
> > Represent the RPU domain resources in one device node. Each RPU
> > processor is a subnode of the top RPU domain node.
> >
> > Signed-off-by: Jason Wu <j.wu@xilinx.com>
> > Signed-off-by: Wendy Liang <jliang@xilinx.com>
> > Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> > Signed-off-by: Ben Levinsky <ben.levinsky@xilinx.com>
> > ---
> > v3:
> > - update zynqmp_r5 yaml parsing to not raise warnings for extra
> >   information in children of R5 node. The warning "node has a unit
> >   name, but no reg or ranges property" will still be raised though
> >   as this particular node is needed to describe the
> >   '#address-cells' and '#size-cells' information.
> > v4::
> > - remove warning '/example-0/rpu@ff9a0000/r5@0:
> >   node has a unit name, but no reg or ranges property'
> >   by adding reg to r5 node.
> > v5:
> > - update device tree sample and yaml parsing to not raise any warnings
> > - description for memory-region in yaml parsing
> > - compatible string in yaml parsing for TCM
> > v6:
> > - remove coupling TCM nodes with remoteproc
> > - remove mailbox as it is optional not needed
> > v7:
> > - change lockstep-mode to xlnx,cluster-mode
> > v9:
> > - show example IPC nodes and tcm bank nodes
> > v11:
> > - add property meta-memory-regions to illustrate link
> >   between r5 and TCM banks
> > - update so no warnings from 'make dt_binding_check'
> > v14:
> > - concerns were raised about the new property meta-memory-regions.
> >   There is no clear direction so for the moment I kept it in the series
> > - place IPC nodes in RAM in the reserved memory section
> > v15:
> > - change lockstep-mode prop as follows: if present, then RPU cluster is=
 in
> >   lockstep mode. if not present, cluster is in split mode.
> > ---
> >  .../xilinx,zynqmp-r5-remoteproc.yaml          | 120 ++++++++++++++++++
> >  1 file changed, 120 insertions(+)
> >  create mode 100644
> Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-
> remoteproc.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp=
-
> r5-remoteproc.yaml
> b/Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-
> remoteproc.yaml
> > new file mode 100644
> > index 000000000000..ce02e425692e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-
> remoteproc.yaml
> > @@ -0,0 +1,120 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: "http://devicetree.org/schemas/remoteproc/xilinx,zynqmp-r5-
> remoteproc.yaml#"
> > +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> > +
> > +title: Xilinx R5 remote processor controller bindings
> > +
> > +description:
> > +  This document defines the binding for the remoteproc component that
> loads and
> > +  boots firmwares on the Xilinx Zynqmp and Versal family chipset.
> > +
> > +  Note that the Linux has global addressing view of the R5-related mem=
ory
> (TCM)
> > +  so the absolute address ranges are provided in TCM reg's.
>=20
> blank line needed.
>=20
will fix in next rev.
> TCMs specifically I'm concerned about how they are represented in system
> DT and here...
>=20
So System DT can tie in with lopper plugin/assists so that TCMs are output =
to whatever the linux driver expects.=20
> > +maintainers:
> > +  - Ed Mooring <ed.mooring@xilinx.com>
> > +  - Ben Levinsky <ben.levinsky@xilinx.com>
> > +
> > +properties:
> > +  compatible:
> > +    const: "xlnx,zynqmp-r5-remoteproc-1.0"
>=20
> Don't need quotes.
>=20
will fix in next rev.
> The use of version numbers was allowed for Xilinx programmable IP. I
> don't think this falls into that category.
>=20
will fix in next rev.
> > +
> > +  lockstep-mode:
> > +    description:
> > +      If this property is present, then the configuration is lock-step=
.
>=20
> boolean...
>=20
By this comment do you mean you want this to change or mention that it is i=
mplicitly Boolean?
> > +      Otherwise RPU is split.
> > +    maxItems: 1
>=20
> ...or an array?
>=20
> Either way, doesn't work for TI R5.
>=20
So as the configuration for both the TI R5 and Xilinx R5 is independent wha=
t in common would you like to see here?
For example Xilinx driver can similarly have the "Xilinx,cluster-mode" or "=
cluster-mode" but for Xilinx platform manager our split configuration value=
 in Xilinx platform manager is '0' while in TI drver it is '1'. So I can ma=
ke the driver expect it then translate if needed if this what you prefer.=20

Otherwise how would  you suggest the Xilinx r5 remoteproc driver describe s=
plit/lockstep mode?
> > +
> > +  interrupts:
> > +    description:
> > +      Interrupt mapping for remoteproc IPI. It is required if the
> > +      user uses the remoteproc driver with the RPMsg kernel driver.
> > +    maxItems: 6
> > +
> > +  memory-region:
> > +    description:
> > +      collection of memory carveouts used for elf-loading and inter-pr=
ocessor
> > +      communication.
> > +    maxItems: 4
> > +    minItems: 4
>=20
> Need to define what each region is.
>=20
> One blank line between properties.
>=20
will fix in next rev. for memory-regions is the following ok?
      collection of phandles for memory carveouts for elf-loading and
       inter-processor communication.

       This collection can consist of reserved-mem carveouts in DDR.

> > +  meta-memory-regions:
> > +    description:
> > +      collection of memories that are not present in the top level mem=
ory
> > +      nodes' mapping. For example, R5s' TCM banks. These banks are nee=
ded
> > +      for R5 firmware meta data such as the R5 firmware's heap and sta=
ck
>=20
> Humm, needs a better explanation.
How is the following:
Collection of phandles for reserved on-chip SRAM regions.


Otherwise I can get rid of this property and combine into memory-region if =
you wish.

>=20
> > +  pnode-id:
> > +    maxItems: 1
>=20
> What's this?
>=20
Can add the following:
power node id that is used to uniquely identify the RPU for Xilinx
      Power Management. The value is then passed to Xilinx platform
      manager for power on/off and access.
> > +  mboxes:
> > +    maxItems: 2
>=20
> Need to define what each one is.
>=20
How is the following:
array of phandles that describe the rx and tx for xilinx zynqmp
      mailbox driver. order of rx and tx is described by the mbox-names
      property. This will be used for communication with remote
      processor.
> > +  mbox-names:
> > +    maxItems: 2
>=20
> Need to define the names.
>=20
How is the following:
array of strings that denote which item in the mboxes property array
      are the rx and tx for xilinx zynqmp mailbox driver
> > +
> > +examples:
> > +  - |
> > +     reserved-memory {
> > +          #address-cells =3D <1>;
> > +          #size-cells =3D <1>;
> > +          ranges;
> > +          elf_load: rproc@3ed000000 {
> > +               no-map;
> > +               reg =3D <0x3ed00000 0x40000>;
> > +          };
> > +
> > +          rpu0vdev0vring0: rpu0vdev0vring0@3ed40000 {
> > +               no-map;
> > +               reg =3D <0x3ed40000 0x4000>;
> > +          };
> > +          rpu0vdev0vring1: rpu0vdev0vring1@3ed44000 {
> > +               no-map;
> > +               reg =3D <0x3ed44000 0x4000>;
> > +          };
> > +          rpu0vdev0buffer: rpu0vdev0buffer@3ed48000 {
> > +               no-map;
> > +               reg =3D <0x3ed48000 0x100000>;
> > +          };
> > +
> > +     };
> > +
> > +     /*
> > +      * Below nodes are required if using TCM to load R5 firmware
> > +      * if not, then either do not provide nodes are label as disabled=
 in
> > +      * status property
> > +      */
> > +     tcm0a: tcm_0a@ffe00000 {
> > +         reg =3D <0xffe00000 0x10000>;
> > +         pnode-id =3D <0xf>;
> > +         no-map;
> > +         status =3D "okay";
> > +         phandle =3D <0x40>;
> > +         compatible =3D "xlnx,tcm";
>=20
> TCM is a Xilinx specific thing?
>=20
No... good point. Can remove the compatible string in next rev.
> > +     };
> > +     tcm0b: tcm_1a@ffe20000 {
> > +         reg =3D <0xffe20000 0x10000>;
> > +         pnode-id =3D <0x10>;
> > +         no-map;
> > +         status =3D "okay";
> > +         compatible =3D "xlnx,tcm";
> > +         phandle =3D <0x41>;
> > +     };
> > +
> > +     rpu {
> > +          compatible =3D "xlnx,zynqmp-r5-remoteproc-1.0";
> > +          #address-cells =3D <1>;
> > +          #size-cells =3D <1>;
> > +          ranges;
> > +          lockstep-mode;
> > +          r5_0 {
> > +               ranges;
> > +               #address-cells =3D <1>;
> > +               #size-cells =3D <1>;
> > +               memory-region =3D <&elf_load>,
> > +                               <&rpu0vdev0vring0>,
> > +                               <&rpu0vdev0vring1>,
> > +                               <&rpu0vdev0buffer>;
> > +               meta-memory-regions =3D <&tcm_0a>, <&tcm_0b>;
> > +               pnode-id =3D <0x7>;
> > +          };
> > +     };
> > +
> > +...
> > --
> > 2.17.1
> >
Thank you,
Ben


