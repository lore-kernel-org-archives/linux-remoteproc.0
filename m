Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	PDS_BAD_THREAD_QP_64,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2D44C433DB
	for <linux-remoteproc@archiver.kernel.org>; Thu, 11 Mar 2021 01:27:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A09C464FC1
	for <linux-remoteproc@archiver.kernel.org>; Thu, 11 Mar 2021 01:27:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229468AbhCKB0i (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 10 Mar 2021 20:26:38 -0500
Received: from mail-db8eur05on2074.outbound.protection.outlook.com ([40.107.20.74]:43361
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229467AbhCKB03 (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 10 Mar 2021 20:26:29 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dz/b4DvIptmRGKcXI3vJ16zj2tDZfXga7f0j701osKu8I4grvBYGN/ucwxICKlY67qc8jualFEct3UWoJ4HnGtrIUPhoWT2QUjtMqXqnwwI/cl+SL9qG8+YvQ2tHzE69zb4EBS8wZbYt0TC/yqDdnG+qezxVYNv5QUQ2f3YuhGtml5vO0xmBO82LjLPDqJOY1juZpPbIChnclgig+kq+kBgQuFhH8F3bRjr6QXjX4pAiD03Pg1zNdANvX/rfil+8In6q+yjjLtSB+o3bWxrMZ8QfwlKgf7rISr7nVsHFT8RHnQiVzStof1P8eDvcLrwZO+WaRx+QSF7jNkzp4Jeb2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=38JongcZMwTZRE0yycFHYm1kWwiHQlSIlGGlGjHxUs0=;
 b=KUFmFnaFe803oyQarEhRJszhRqiH89PZt2Yw20s2zBUAQqba5iUtzGjHWADBo5VVmmiey24HbU9uzGUeikGGEuIvbMU6JYI0cDYP7RlpImrKDu5JCFrALbo2ebSxLG1CVeCBch5RniUvi92oud3uNAR4UqrbEQ5xbSLkLqc+II11r/K6qUAC/AqCePtHPs72q6ojjU5mw6n1PFUqJoVpQYmRfVoAnhxJf1jY7TBhYwkA11trM52cWbnnqR1bGcJeARffiDxqBx89rNwrC4aUoTsm9OyeIgM1rPkfMqnqrO8Gf6836W6gSWv+PmXFawz8ae5zcIERevEr81JxfW50Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=38JongcZMwTZRE0yycFHYm1kWwiHQlSIlGGlGjHxUs0=;
 b=WQiPHwWsDv2U5fEPJrZKLbF5Roz6jkrrAIglI5lRkBEoWt97TyVO0dsFA9WoKPB47C3JUgPRdJ2q9x/n6jAZQEOpZFPkquJJxLPj/0vS+SOxJTmZJOkKRXJbE9Irwi7ysOeMI6G/ONOChbvC6HgTRGx4Bd3ZCIUP5OOE6gdESaU=
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB5468.eurprd04.prod.outlook.com (2603:10a6:10:86::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Thu, 11 Mar
 2021 01:26:26 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0%9]) with mapi id 15.20.3846.054; Thu, 11 Mar 2021
 01:26:26 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
CC:     "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "o.rempel@pengutronix.de" <o.rempel@pengutronix.de>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "paul@crapouillou.net" <paul@crapouillou.net>,
        "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
        "agross@kernel.org" <agross@kernel.org>,
        "patrice.chotard@st.com" <patrice.chotard@st.com>
Subject: RE: [PATCH V13 00/10] remoteproc: imx_rproc: support iMX8MQ/M
Thread-Topic: [PATCH V13 00/10] remoteproc: imx_rproc: support iMX8MQ/M
Thread-Index: AQHXEn0bWg+YVUHx806FhkZC7TjAq6p6RYOAgAO/5oA=
Date:   Thu, 11 Mar 2021 01:26:25 +0000
Message-ID: <DB6PR0402MB276009028DF766731BB2C06888909@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <1615029865-23312-1-git-send-email-peng.fan@oss.nxp.com>
 <20210308160815.GB3977653@xps15>
In-Reply-To: <20210308160815.GB3977653@xps15>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5969dce9-afe1-4981-7b17-08d8e42cb061
x-ms-traffictypediagnostic: DB7PR04MB5468:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB54681A9806C2AF3CF5BE4B35C9909@DB7PR04MB5468.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: m0yCdzg/927GUgDah4iHw2WbYpgBfBKitaUDPuCFYXW9PomSskEoa4qdkKXY8lhIbijJD322f713rTrkpVozo8ml1PohEtLygVo4WWP0EQ/hf0Q/z/rQl4xmEPdACX6irfmYvaNjOvp1RFaJhSm1rE/noxk4Ftl7chMIskMiUlPBPpZgAaGk3ZBJFLHOJUkO25CurHhxjUUhFa9PqdwL49mF3VMTtf7oxMG5bN9arhLMbOSlH/GjE0FnaP3x7LUIe/54hbi+mhFu3+zwOfvG2epOJQkqrMi0idJXlF9PqrEalRCwND/iZ+ZWBcoO9MG6nt2MRmMEmET0SZgSHCaN02CE1/v9FTzknoQEAsVvI7VQEjmtFBkExnj2K3W0STMEzChKfHeU1xIu6yTQVsoWSTRCfMvnUMD9h9oeOJNQxMrXQYLn/3/ghBuPUUTZVYPtGrP0eovaGTzqMJd2jsJxC886wMlRiOjW4lcQN8q9vYKkn/kh93sOfyPpf91gN/GkCYoQ/HX1lp9lsyJhDcToG9BiWEoPDv8k8j97LNxjswSn3AmskcEJo9qFV/sYsG3AlE/F/xdbffkxI/I3BCf48NuRSOFNcunxrsW/3CjAd19wauhK4TranFSNypMo4rvt27xmifHu9Q6+tsOBozel6A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(396003)(39850400004)(366004)(45080400002)(8676002)(54906003)(110136005)(71200400001)(7696005)(5660300002)(33656002)(2906002)(7416002)(26005)(52536014)(8936002)(66446008)(478600001)(966005)(6506007)(64756008)(66946007)(4326008)(186003)(66556008)(76116006)(55016002)(86362001)(316002)(83380400001)(66476007)(9686003)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?rV2yVNsau30ZYsGZYCTSvAzci9m7HEuwNa9+IGR8q4iBdJP0SIuJIcfc/usV?=
 =?us-ascii?Q?XBMdqyPF/wXgLN/FfXTLpJg27UuV99ENTC4XefhkPAg4Wj1MWhnM0o+chGsZ?=
 =?us-ascii?Q?kYHo2TAyAhMFa6Gfp89IWn/c8VArSK5gHuxQULUM0SkqFR5cEYSlqRaoQiAd?=
 =?us-ascii?Q?mNFasVPMvxXWPDeCJzTELiAigjZBzCtxQ9x0zyGdMUsH3RqeFCsFrv61fBfo?=
 =?us-ascii?Q?xWCm5Ab7ug1AhvXHUTfGDww5BnQNgeIiBhdCVaDiY+9D0UWoSZ2cbR5wkvBH?=
 =?us-ascii?Q?53YhRcTYeKfzJpGbqRLF7PQgWn3VdkRQE2HQCf0lpoeKsQNcsEqHl5vteOPL?=
 =?us-ascii?Q?GoCpf5+dUTe+/LlvKb5QvqN/n2UxJkj+PKCnnm0aTO98TK2jEBmC9NCDY5SD?=
 =?us-ascii?Q?05/bpmaanbh6Czs/smyRCACwjz7vloS3aFf78O1URTdcrAeFANYAE15QIBFw?=
 =?us-ascii?Q?2OB4XanSMP+9pKSYiDnCMcTc2w3ITUEyW9RTHgVDiR1bOrOX4sxvtF9VyDoL?=
 =?us-ascii?Q?5O+yY4LkueD0XUv0TREXg7y5zkoiqUVRpZ1wCzdPEqAh/BaA+FqgiWl7gi7O?=
 =?us-ascii?Q?WMHGlFKXwEYTuXcv/CvJjs5C/qvOdzLO7U35RCSzqyrn36kmGCafgqODrNVp?=
 =?us-ascii?Q?XW4mlpxOjKPRoyRCTOFhB9TxM5tDeF/uNqhX7GxMma4c7fBBa8qOmgDI83dz?=
 =?us-ascii?Q?emOr/wWlroxUCaeF2kHJS1gqNjYGwtaLpcwQelhLGmRtN2EM08nvSNqatlv9?=
 =?us-ascii?Q?5UDcIBQTOX27sxih+1qmRGIPCQj0DjXIn130YzY2/u3ph/06UDHNOz8fSWHG?=
 =?us-ascii?Q?pspY/2U7hos8pL3KPDD19HY57iwPDkgQI5+Rjh/L5NLkwZFQonEHmSun+HZh?=
 =?us-ascii?Q?7pXFiXwI0VYhz8bg6+WMbtfntj6wKDVkK597fY/pHlVLrTIQgKEtOMx5FkXd?=
 =?us-ascii?Q?0Vp9+nNE4B5su9R5jVRbkpAltvBa0cRRKx3WnvCA6k/MyYFYKwHtc0a/LhE3?=
 =?us-ascii?Q?nFFcaif61GWUjza0CUeBCaGD/Aqupn4U6WN3pnhgnxp2Y3Bz6nKI2kfS4HUw?=
 =?us-ascii?Q?CjtloUs/PMc3RP9SWYko2j7s2GiKA0PT1SEkuZ85kcf0ypgHh8pgLrJD/L3I?=
 =?us-ascii?Q?ojMRltIwsHV6WF7CmcH7WbrGmbJb72pwAroUV04FKZPBHAmzhh0D9IC33DpT?=
 =?us-ascii?Q?St10Evxh5vv1ctKN0a0BokftFECqB9NeNBokjYWJdb6FhiRRaT/WDxRNrW3Y?=
 =?us-ascii?Q?3PqbSCzqDryaKeNmkZdNJuxw+bijMZ2M1YYutwaPBOilhT5Nmx3kAvxomHH4?=
 =?us-ascii?Q?Fjm1eindzkE2UVdyifHibllK?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5969dce9-afe1-4981-7b17-08d8e42cb061
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2021 01:26:26.0478
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +GPv8rRQNfx8hUIHGE8wiTOhbqUo06AM1ZrbS3jhQDZ47o3wHomjUQt1RtcV0EBvm9eGi6sj1rZjUST/SJTL2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5468
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Mathieu,

> Subject: Re: [PATCH V13 00/10] remoteproc: imx_rproc: support iMX8MQ/M
>=20
> On Sat, Mar 06, 2021 at 07:24:15PM +0800, peng.fan@oss.nxp.com wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> >
> > V13:
> >  Add R-b tag from Rob for patch 1.
> >  Drop the reserved memory node from patch 2 per Rob's comment.
> >  Mathieu, Bjorn
> >   Only patch 2 not have R-b/A-b tag, but since Rob's only has a minor
> comment, and
> >   addressed in this version, is it ok for you take into remoteproc next
> branch?
> >   Thanks.
>=20
> As much as I want to, there is no way to move forward without an
> acknowledgement from Rob.

Rob has gave his R-b tag for patch 2/13, please help pick up this patchset.
I really wanna this feature in which has been for a long time. Then
I will move on to add new stuff.

Thanks,
Peng.


>=20
> >
> > V12:
> >  Add maxItems to avoid dt_bindings_check fail  Rebased on top of
> > linux-next
> >
> > V11:
> >  Per Rob's comments, fix memory-region in patch 1/10  Rebased on top
> > of Linux-next
> >
> > V10:
> >  Per Rob's comments, fix patch 1/10
> >
> > V9:
> >  Per Mathieu's comments,
> >    update the tile of yaml in patch 2/10
> >    update the Kconfig and MODULE_DESCRIPTION, I merge this change in
> patch 8/10,
> >    since this is a minor change, I still keep Mathieu's R-b tag. If any
> objection, I could remove.
> >    Add R-b tag in Patch 10/10
> >
> >  Rob, please help review patch 1/10 and 2/10
> >
> > V8:
> >  Address sparse warning in patch 4/10 reported by kernel test robot
> >
> > V7:
> >  Add R-b tag from Mathieu
> >  vdevbuffer->vdev0buffer in patch 1/10, 7/10  correct err msg and
> > shutdown seq per Mathieu's comments in patch 10/10  Hope this version
> > is ok to be merged.
> >
> > V6:
> >  Add R-b tag from Mathieu
> >  Convert imx-rproc.txt to yaml and add dt-bindings support for
> > i.MX8MQ/M, patch 1/10 2/10  No other changes.
> >
> > V5:
> >  Apply on Linux next
> >  Add V5 subject prefix
> >  Add R-b tag from Bjorn for 1/8, 2/8, 3/8
> >
> > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fpat=
c
> >
> hwork.kernel.org%2Fproject%2Flinux-remoteproc%2Fcover%2F20201229033
> 019
> > .25899-1-peng.fan%40nxp.com%2F&amp;data=3D04%7C01%7Cpeng.fan%40n
> xp.com%7
> >
> C18c2709725e14cbab54408d8e24c6492%7C686ea1d3bc2b4c6fa92cd99c5c3
> 01635%7
> >
> C0%7C0%7C637508165016988280%7CUnknown%7CTWFpbGZsb3d8eyJWIjoi
> MC4wLjAwMD
> >
> AiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata
> =3DbwlT
> > uTk6iRuZke6SMhuyB2gxniStfxnX%2BKlVgm7MZuk%3D&amp;reserved=3D0
> >
> > V4:
> >  According to Bjorn's comments, add is_iomem for da to va usage  1/8,
> > 2/8 is new patch  3/8, follow Bjorn's comments to correct/update the
> > err msg.
> >  6/8, new patch
> >  8/8, use dev_err_probe to simplify code, use queue_work instead
> > schedule_delayed_work
> >
> > V3:
> >  Since I was quite busy in the past days, V3 is late  Rebased on
> > Linux-next  Add R-b tags
> >  1/7: Add R-b tag of Mathieu, add comments
> >  4/7: Typo fix
> >  5/7: Add R-b tag of Mathieu, drop index Per Mathieu's comments
> >  6/7: Add R-b tag of Mathieu
> >  7/7: Add comment for vqid << 16, drop unneeded timeout settings of
> mailbox
> >       Use queue_work instead of schedule_delayed_work
> >       free mbox channels when remove
> >
> > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flkm=
l
> > .org%2Flkml%2F2020%2F12%2F4%2F82&amp;data=3D04%7C01%7Cpeng.fan
> %40nxp.com
> > %7C18c2709725e14cbab54408d8e24c6492%7C686ea1d3bc2b4c6fa92cd9
> 9c5c301635
> > %7C0%7C0%7C637508165016988280%7CUnknown%7CTWFpbGZsb3d8eyJ
> WIjoiMC4wLjAw
> >
> MDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sd
> ata=3DxQ
> >
> ReFFdUT2ZLhWyT2Vt2v0frG0xKq2psP1ExnLx%2BLXw%3D&amp;reserved=3D0
> >
> > V2:
> >  Rebased on linux-next
> >  Dropped early boot feature to make patchset simple.
> >  Drop rsc-da
> >
> > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fpat=
c
> >
> hwork.kernel.org%2Fproject%2Flinux-remoteproc%2Fcover%2F20200927064
> 131
> > .24101-1-peng.fan%40nxp.com%2F&amp;data=3D04%7C01%7Cpeng.fan%40n
> xp.com%7
> >
> C18c2709725e14cbab54408d8e24c6492%7C686ea1d3bc2b4c6fa92cd99c5c3
> 01635%7
> >
> C0%7C0%7C637508165016988280%7CUnknown%7CTWFpbGZsb3d8eyJWIjoi
> MC4wLjAwMD
> >
> AiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata
> =3DBWGP
> >
> gbVtOjOa%2BriGryGp9sh2CSY%2BhMESdGD%2F7LvPJ6w%3D&amp;reserved
> =3D0
> >
> > V1:
> >
> > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fpat=
c
> >
> hwork.kernel.org%2Fcover%2F11682461%2F&amp;data=3D04%7C01%7Cpeng.f
> an%40n
> >
> xp.com%7C18c2709725e14cbab54408d8e24c6492%7C686ea1d3bc2b4c6fa9
> 2cd99c5c
> >
> 301635%7C0%7C0%7C637508165016988280%7CUnknown%7CTWFpbGZsb3
> d8eyJWIjoiMC
> >
> 4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&
> amp;sd
> >
> ata=3DXkGYIxBgrHLwV7R3bro87N6fL7777Wa5rOAZdVjCoZs%3D&amp;reserved
> =3D0
> >
> > This patchset is to support i.MX8MQ/M coproc.
> > The early boot feature was dropped to make the patchset small in V2.
> >
> > Since i.MX specific TCM memory requirement, add elf platform hook.
> > Several patches have got reviewed by Oleksij and Mathieu in v1.
> >
> >
> > Peng Fan (10):
> >   dt-bindings: remoteproc: convert imx rproc bindings to json-schema
> >   dt-bindings: remoteproc: imx_rproc: add i.MX8MQ/M support
> >   remoteproc: introduce is_iomem to rproc_mem_entry
> >   remoteproc: add is_iomem to da_to_va
> >   remoteproc: imx_rproc: correct err message
> >   remoteproc: imx_rproc: use devm_ioremap
> >   remoteproc: imx_rproc: add i.MX specific parse fw hook
> >   remoteproc: imx_rproc: support i.MX8MQ/M
> >   remoteproc: imx_rproc: ignore mapping vdev regions
> >   remoteproc: imx_proc: enable virtio/mailbox
> >
> >  .../bindings/remoteproc/fsl,imx-rproc.yaml    |  90 ++++++
> >  .../bindings/remoteproc/imx-rproc.txt         |  33 ---
> >  drivers/remoteproc/Kconfig                    |   6 +-
> >  drivers/remoteproc/imx_rproc.c                | 262
> +++++++++++++++++-
> >  drivers/remoteproc/ingenic_rproc.c            |   2 +-
> >  drivers/remoteproc/keystone_remoteproc.c      |   2 +-
> >  drivers/remoteproc/mtk_scp.c                  |   6 +-
> >  drivers/remoteproc/omap_remoteproc.c          |   2 +-
> >  drivers/remoteproc/pru_rproc.c                |   2 +-
> >  drivers/remoteproc/qcom_q6v5_adsp.c           |   2 +-
> >  drivers/remoteproc/qcom_q6v5_pas.c            |   2 +-
> >  drivers/remoteproc/qcom_q6v5_wcss.c           |   2 +-
> >  drivers/remoteproc/qcom_wcnss.c               |   2 +-
> >  drivers/remoteproc/remoteproc_core.c          |   7 +-
> >  drivers/remoteproc/remoteproc_coredump.c      |   8 +-
> >  drivers/remoteproc/remoteproc_debugfs.c       |   2 +-
> >  drivers/remoteproc/remoteproc_elf_loader.c    |  21 +-
> >  drivers/remoteproc/remoteproc_internal.h      |   2 +-
> >  drivers/remoteproc/st_slim_rproc.c            |   2 +-
> >  drivers/remoteproc/ti_k3_dsp_remoteproc.c     |   2 +-
> >  drivers/remoteproc/ti_k3_r5_remoteproc.c      |   2 +-
> >  drivers/remoteproc/wkup_m3_rproc.c            |   2 +-
> >  include/linux/remoteproc.h                    |   4 +-
> >  23 files changed, 393 insertions(+), 72 deletions(-)  create mode
> > 100644 Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> >  delete mode 100644
> > Documentation/devicetree/bindings/remoteproc/imx-rproc.txt
> >
> > --
> > 2.30.0
> >
