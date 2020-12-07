Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27ACDC4361B
	for <linux-remoteproc@archiver.kernel.org>; Mon,  7 Dec 2020 20:59:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E3B6F238EC
	for <linux-remoteproc@archiver.kernel.org>; Mon,  7 Dec 2020 20:59:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725933AbgLGU65 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 7 Dec 2020 15:58:57 -0500
Received: from mail-dm6nam11on2072.outbound.protection.outlook.com ([40.107.223.72]:38747
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725885AbgLGU65 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 7 Dec 2020 15:58:57 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QSwg7Uf2SEfwiqGYrJuTLEkBzJxmeXQFHUCCJwD2PH56I/UYrSWhSsftfKKWatLgNBIJJ6a588hm4RgiocghugYtG/fqEhwgrrrRRH7xyVT6xjPf9iZBDvyLrntfvUGieloaGAXTzdyTKsLAy1I9boRzMtPVlVNDaAIH+PQx0fuPTWVUgDK5TTU7iiijg+wkjnZ4C9aV/uX9HtS4upahCSrguHsR707wIzI3B4wdNU5Pbj8CrL0GpidSnyh1Apd6JK1EQ63WCps5ooYwm/Y/6/Qcbb/gqv5QLHeXfIT+UTf/t5EfYPEFqJC5opdbezX6pin8hYNnnV9r30yIoh5eaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pjDRJffQyR8qhdg9SQIhho3SGdSt45aGkgItLox2Zug=;
 b=dslhJBuMpRIr2hUfaVvQmmJogNSD0Rw1mvU3YIziFKFUHyYeoWLCBw3mLF7VUmz/SuCkV813rcSyx921gbJn5cmh3wxeWsQqrDAvR6zo+RMnAIsuUkZsufy0JPGLk+cL5AyIMSTgMrjgFnttlI7fnP+U192cpduh94EV8m/v48zbENpRYDbhjToD7c9a3tb6Ap8l/U747vRk4ouYc5GQuPDAOMfeq65g9Bm14CE+UouYPTHywPwLOBr1PwFSwizNgneEryOsQHT92gIhpOdqKyWjlNUBE1OJKXBHnHYs+/aWDxTFQB34Tt3cnOAnoNTt9d8eDl0FSLyX2f8XcZwXCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pjDRJffQyR8qhdg9SQIhho3SGdSt45aGkgItLox2Zug=;
 b=ZWSTkN0kSU2X84SVJ45Tlh77katX2dvOEaOt4yhdcy6h4UBOWoT8iAgLm5ZvlUYBnyYU6x8QP0OH4VN4yAk+GPWM8vF3/hCE/WUKDZMitvw6739VPb3+PtaosWIANuBfBh3VmCwcvrGCtew1+YIOL5ONwZkJZJhLjV1NISj2CKA=
Received: from BYAPR02MB4407.namprd02.prod.outlook.com (2603:10b6:a03:55::31)
 by SJ0PR02MB7582.namprd02.prod.outlook.com (2603:10b6:a03:323::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.18; Mon, 7 Dec
 2020 20:58:02 +0000
Received: from BYAPR02MB4407.namprd02.prod.outlook.com
 ([fe80::795a:77f:7116:bb95]) by BYAPR02MB4407.namprd02.prod.outlook.com
 ([fe80::795a:77f:7116:bb95%5]) with mapi id 15.20.3632.021; Mon, 7 Dec 2020
 20:58:02 +0000
From:   Ben Levinsky <BLEVINSK@xilinx.com>
To:     "robh+dt@kernel.org" <robh+dt@kernel.org>
CC:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v24 4/5] dt-bindings: remoteproc: Add documentation for
 ZynqMP R5 rproc bindings
Thread-Topic: [PATCH v24 4/5] dt-bindings: remoteproc: Add documentation for
 ZynqMP R5 rproc bindings
Thread-Index: AQHWxzIu7vQgQaa9/UaPxUPgJ3pwGqnr+FUAgAAwGFA=
Date:   Mon, 7 Dec 2020 20:58:02 +0000
Message-ID: <BYAPR02MB4407981B3E17E01E0AFA64E4B5CE0@BYAPR02MB4407.namprd02.prod.outlook.com>
References: <20201130155717.26008-1-ben.levinsky@xilinx.com>
 <20201130155717.26008-5-ben.levinsky@xilinx.com>
 <20201207180410.GB1509079@xps15>
In-Reply-To: <20201207180410.GB1509079@xps15>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=xilinx.com;
x-originating-ip: [24.5.142.107]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: bae017ab-49a5-4b70-eebf-08d89af2c983
x-ms-traffictypediagnostic: SJ0PR02MB7582:
x-microsoft-antispam-prvs: <SJ0PR02MB75825BCF231FAE22ECE951CDB5CE0@SJ0PR02MB7582.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0GxkfD9UYMS5FB8Iu/a5z91slBISkte5oqh3/ek0RrHRJzsPzdLuMC0QoCUq8H0NtDTc5du/1us6Ftl6z1Q0AQB5RdAaFZpTEJNvELIVb5mgPKyXb4vTzwfTSI/aUSR1stCrcfjSPYAt4gZKx6V9QZNNFJYHYCzbtM8H4R497eB1/QhHuLvHKziOKUvhb55ehS02CnJOJWASObTTIF4pU+nwJPBaXJFKRWTFCheddO0pEQ0MD/sy6RdrO5Asx2M0DN8oQP9J8mGOrSj3RlQb03GknJkfq4GYtMz1hn1LyRnlD7dbaOrWpsTENXDL3o0Jno1+lGzBexOa0WRa0LJZoicLmoiDvVYj5HVjeh4z7vzxZeUcM0Zw7oPctFYjPuKhM+p1BNYSwFbFav0xIWOqHA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR02MB4407.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(396003)(136003)(376002)(346002)(66446008)(83380400001)(6506007)(26005)(66946007)(66556008)(66476007)(2906002)(186003)(64756008)(53546011)(54906003)(7696005)(8936002)(55016002)(316002)(33656002)(71200400001)(76116006)(478600001)(86362001)(52536014)(4326008)(5660300002)(8676002)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?OmmrnlNaugZ7KONrHarZXI7iC9oF+T6mmNd6iTLXZZtIMFs3IhPFiIU6sEIC?=
 =?us-ascii?Q?LRed6oCcaZkXoAvSoIbzaVL8i7H+0Fo9mOkkAGs3naIz5af/+FC8+NN8Jruf?=
 =?us-ascii?Q?LeOHEGHILddBmZA1bZzIo7lJcah7WQ1OLWnDQY61hPVOdz73G82/ygH3mn8K?=
 =?us-ascii?Q?7e00Naykb+OxJn1GcfT1nIwzEgHlUh7b1uc5Sm1aXsZJNL+VK5dp1MZgFojL?=
 =?us-ascii?Q?gSNyGyxmdbQW17/9mb0qKv0nBZULe0aLDfhnpsFmb7XzZPF4q2todEcPAwt0?=
 =?us-ascii?Q?0Bf6EGtFohdI94lwEpOCDIVBnV/PlL46hxg7kmaz/MlmcW2IGeq4dSOQ73gy?=
 =?us-ascii?Q?h3n/UNI4ns9dK4ZeudTT/xerwuAnPskpAK5KrGqP7VmzpPnJRW0URPkPaFhq?=
 =?us-ascii?Q?bGyQN/uJbzOZP6a+GmLVZ3aBJ8gflUk8hzYixW2t++up5+hZT6boONviAJiK?=
 =?us-ascii?Q?jqROjMZbpRXNxQW7bNzSruODPyyZAmHgiJHitEj+qZFGN+PPPULAIu80nsob?=
 =?us-ascii?Q?liSLlkXMS7154+cn11HPwxMWaiGvOl1hTxdbfMprjX0CWGKwYv8/wclpGJj8?=
 =?us-ascii?Q?j1pwsdqHD/zdJF/RCjjCzQDdW+gFyXNXQJIpJMPKW6K+YEnnQYaBwK9yp/P8?=
 =?us-ascii?Q?GbHBc4HSOb7BCZfZlVJnbW/4MEQkc3L7dfQNxeoP9Ck7LxrZFMfZx0N4LYOe?=
 =?us-ascii?Q?23FWCGY2rZ7KVxiidygJW3BohlDVFqHXxYYV/5FT5pEsHB1QBoimh1FVD0PQ?=
 =?us-ascii?Q?9qgtJ6mGc6kbhXhPAeOvX4r3qeuU3XQfwwsOtDIFBn8icb/liNLKsJfS+22j?=
 =?us-ascii?Q?k0+8vbOZsusqNDAjmT8wIqhPn/FwvPw/ELtYZUa8o7SdeAEPf48qRtvwb4VP?=
 =?us-ascii?Q?IR3SqNo6Dxf35t2sL0N8kCysAGDcebo3qlX0eWfd8qxrBRujAxsWdwvlr1kj?=
 =?us-ascii?Q?s0a1Jo8amNWI3SFt0XrE7Pugws9orVO0jfnXOHhMrA8=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4407.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bae017ab-49a5-4b70-eebf-08d89af2c983
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2020 20:58:02.5055
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BIG7pT4KX6LcyEf/Qmnzv3um6DtjJbc6FSmi3T2qpp0qya4S9/ETnmE68W2LFxr9BkqGVM+IrB6reM0mcBJgsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7582
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Mathieu,

Thanks for the clarification. IIRC he is on the device tree list so should =
see this. Ill add him on this particular thread to be safe.

+Rob

Best,
Ben


> -----Original Message-----
> From: Mathieu Poirier <mathieu.poirier@linaro.org>
> Sent: Monday, December 7, 2020 10:04 AM
> To: Ben Levinsky <BLEVINSK@xilinx.com>
> Cc: devicetree@vger.kernel.org; linux-remoteproc@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org
> Subject: Re: [PATCH v24 4/5] dt-bindings: remoteproc: Add documentation f=
or
> ZynqMP R5 rproc bindings
>=20
> Rob Herring is the maintainer of all the yaml files - he is the one this =
patch
> needs to go to.  I merely look at them to understand the platform device
> implementation.
>=20
> On Mon, Nov 30, 2020 at 07:57:16AM -0800, Ben Levinsky wrote:
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
> > v24: update for 'make dt_binding_check' errors
> > ---
> >  .../xilinx,zynqmp-r5-remoteproc.yaml          | 223 ++++++++++++++++++
> >  1 file changed, 223 insertions(+)
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
> > index 000000000000..bccbdee8c3f2
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-
> remoteproc.yaml
> > @@ -0,0 +1,223 @@
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
> > +  boots firmwares on the Xilinx Zynqmp and Versal family chipsets.
> > +
> > +  Note that the Linux has global addressing view of the R5-related mem=
ory
> (TCM)
> > +  so the absolute address ranges are provided in TCM reg's.
> > +
> > +maintainers:
> > +  - Ed Mooring <ed.mooring@xilinx.com>
> > +  - Ben Levinsky <ben.levinsky@xilinx.com>
> > +
> > +properties:
> > +  $nodename:
> > +    pattern: "^r5fss(@.*)?"
> > +
> > +  compatible:
> > +    enum:
> > +      - xlnx,zynqmp-r5-remoteproc
> > +
> > +  reg:
> > +    items:
> > +      - description: Address and Size of Xilinx RPU Configuration regi=
ster
> > +
> > +  "#address-cells":
> > +    const: 2
> > +
> > +  "#size-cells":
> > +    const: 2
> > +
> > +  ranges: true
> > +
> > +# Optional properties:
> > +# --------------------
> > +  xlnx,cluster-mode:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [0, 1]
> > +    description: |
> > +      Configuration Mode for the Dual R5F cores within the R5F cluster=
.
> > +      Should be either a value of 1 (LockStep mode) or 0 (Split mode),
> > +      default is LockStep mode if omitted.
> > +
> > +
> > +#R5F Processor Child Nodes:
> > +# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> > +
> > +patternProperties:
> > +  "^r5f_[a-f0-9]+$":
> > +    type: object
> > +    description: |
> > +      The R5F Sub-System device node should define one or two R5F chil=
d
> nodes,
> > +      each node representing a Xilinx instantiation of the Arm Cortex =
R5F
> core.
> > +      There should be one or two child nodes if the R5F is in Split mo=
de and
> > +      one child node if the R5F is in Lockstep mode.
> > +
> > +      In Split mode each R5F core has two associated TCM Banks. R5_0 h=
as
> > +      TCM Banks 0A and 0B and R5_1 has TCM Banks 1A and 1B.
> > +
> > +      In Lockstep mode only one R5F child node should be defined. This=
 one
> > +      child has access to TCM Banks 0A, 0B, 1A and 1B and any of the f=
our
> can
> > +      be included in the child R5F's sram property.
> > +
> > +      The example below shows Split mode with two child nodes.
> > +
> > +    properties:
> > +      compatible:
> > +        enum:
> > +          - xilinx,r5f
> > +
> > +# The following properties are mandatory for R5F Core0 in both LockSte=
p
> and Split
> > +# modes, and are mandatory for R5F Core1 _only_ in Split mode.
> > +
> > +      memory-region:
> > +        description: |
> > +          Phandles to the memory nodes to be associated with the
>=20
> Is a word missing here?
>=20
> > +          The reserved memory nodes should be carveout nodes, and
> > +          should be defined with a "no-map" property as per the bindin=
gs in
> > +          Documentation/devicetree/bindings/reserved-memory/reserved-
> memory.txt
> > +        minItems: 1
> > +        maxItems: 6
> > +        items:
> > +          - description: Region used for dynamic DMA allocations like =
vrings
> and
> > +                         vring buffers
> > +          - description: region reserved for firmware image sections
> > +        additionalItems: true
> > +
> > +      power-domain:
> > +        description: |
> > +          Power node ID that is used to uniquely identify the RPU for =
Xilinx
> > +          Power Management.
> > +        maxItems: 1
> > +
> > +# Optional properties:
> > +# --------------------
> > +# The following properties are optional properties for each of the R5F
> cores:
> > +
> > +      mboxes:
> > +        description: |
> > +          Standard property to specify a mailbox
> > +          This property is required only if the rpmsg/virtio functiona=
lity
> > +          is used
> > +
> > +           Refer to the zynqmp-ipi-mailbox documentation for client us=
age of
> this
> > +           property
>=20
> Indentation problem
>=20
> > +        maxItems: 1
> > +
> > +      mbox-names:
> > +        description: |
> > +          Refer to the zynqmp-ipi-mailbox documentation for client usa=
ge of
> this
> > +          property
> > +        items:
> > +          - const: tx
> > +          - const: rx
> > +
> > +      sram:
> > +        $ref: /schemas/types.yaml#/definitions/phandle-array
> > +        minItems: 1
> > +        maxItems: 4
> > +        description: |
> > +          Phandles to one or more reserved on-chip SRAM regions. The r=
egions
> > +          should be defined as child nodes of the respective SRAM node=
, and
> > +          should be defined as per the generic bindings in,
> > +          Documentation/devicetree/bindings/sram/sram.yaml
> > +
> > +    required:
> > +      - compatible
> > +      - power-domain
> > +
> > +    unevaluatedProperties: false
> > +
> > +required:
> > +  - reg
> > +  - compatible
> > +  - "#address-cells"
> > +  - "#size-cells"
> > +  - ranges
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    / {
> > +        compatible =3D "xlnx,zynqmp-zcu102-rev1.0", "xlnx,zynqmp-zcu10=
2",
> "xlnx,zynqmp";
> > +        #address-cells =3D <2>;
> > +        #size-cells =3D <2>;
> > +        model =3D "ZynqMP ZCU102 ";
> > +
> > +        zynqmp_ipi1 {
> > +          compatible =3D "xlnx,zynqmp-ipi-mailbox";
> > +          interrupt-parent =3D <&gic>;
> > +          interrupts =3D <0 33 4>;
> > +          xlnx,ipi-id =3D <5>;
> > +          #address-cells =3D <1>;
> > +          #size-cells =3D <0>;
> > +
> > +          ipi_mailbox_rpu0: mailbox@ff990600 {
> > +            reg =3D <0xff990600 0x20>,
> > +                  <0xff990620 0x20>,
> > +                  <0xff9900c0 0x20>,
> > +                  <0xff9900e0 0x20>;
> > +            reg-names =3D "local_request_region",
> > +            "local_response_region",
> > +            "remote_request_region",
> > +            "remote_response_region";
> > +            #mbox-cells =3D <1>;
> > +            xlnx,ipi-id =3D <3>;
> > +          };
> > +          ipi_mailbox_rpu1: mailbox@ff990780 {
> > +            reg =3D <0xff990780 0x20>,
> > +                  <0xff9907a0 0x20>,
> > +                  <0xff9907c0 0x20>,
> > +                  <0xff9905a0 0x20>;
> > +            reg-names =3D "local_request_region",
> > +            "local_response_region",
> > +            "remote_request_region",
> > +            "remote_response_region";
> > +            #mbox-cells =3D <1>;
> > +            xlnx,ipi-id =3D <3>;
> > +          };
> > +        };
> > +
> > +        r5fss@ff9a0000 {
> > +          compatible =3D "xlnx,zynqmp-r5-remoteproc";
> > +          #address-cells =3D <2>;
> > +          #size-cells =3D <2>;
> > +          ranges;
> > +          reg =3D <0x0 0xff9a0000 0x0 0x10000>;
> > +          xlnx,cluster-mode =3D <0>;
> > +
> > +          r5f_0 {
> > +               compatible =3D "xilinx,r5f";
> > +               memory-region =3D <&elf_load0>,
> > +                               <&rpu0vdev0vring0>,
> > +                               <&rpu0vdev0vring1>,
> > +                               <&rpu0vdev0buffer>;
> > +               sram =3D <&tcm_0a>, <&tcm_0b>;
> > +               mboxes =3D <&ipi_mailbox_rpu0 0x0 &ipi_mailbox_rpu0 0x1=
>;
> > +               mbox-names =3D "tx", "rx";
> > +               power-domain =3D <0x7>;
> > +          };
> > +          r5f_1 {
> > +               compatible =3D "xilinx,r5f";
> > +               memory-region =3D <&elf_load1>,
> > +                               <&rpu1vdev0vring0>,
> > +                               <&rpu1vdev0vring1>,
> > +                               <&rpu1vdev0buffer>;
> > +               sram =3D <&tcm_1a>, <&tcm_1b>;
> > +               mboxes =3D <&ipi_mailbox_rpu1 0x0 &ipi_mailbox_rpu1 0x1=
>;
> > +               mbox-names =3D "tx", "rx";
> > +               power-domain =3D <0x8>;
> > +          };
> > +
> > +        };
> > +    };
> > +
> > +...
> > --
> > 2.17.1
> >
