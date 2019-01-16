Return-Path: <fugang.duan@nxp.com>
From: Andy Duan <fugang.duan@nxp.com>
Subject: RE: [rpmsg PATCH v2 1/1] rpmsg: virtio_rpmsg_bus: fix unexpected huge
 vmap mappings
Date: Wed, 16 Jan 2019 03:38:38 +0000
Message-ID: 
 <VI1PR0402MB36000DE975EBFBD40D1352C4FF820@VI1PR0402MB3600.eurprd04.prod.outlook.com>
References: <1545812449-32455-1-git-send-email-fugang.duan@nxp.com>
 <CAKv+Gu-zfTZAZfiQt1iUn9otqeDkJP-y-siuBUrWUR-Kq=BsVQ@mail.gmail.com>
 <20181226145048.GA24307@infradead.org>
 <VI1PR0402MB3600AC833D6F29ECC34C8D4CFFB60@VI1PR0402MB3600.eurprd04.prod.outlook.com>
 <20181227121901.GA20892@infradead.org>
 <VI1PR0402MB3600799A06B6BFE5EBF8837FFFB70@VI1PR0402MB3600.eurprd04.prod.outlook.com>
 <VI1PR0402MB36000BD05AF4B242E13D9D05FF840@VI1PR0402MB3600.eurprd04.prod.outlook.com>
 <20190110140726.GA6223@infradead.org>
 <VI1PR0402MB3600E7160A2921A8D3DCA055FF850@VI1PR0402MB3600.eurprd04.prod.outlook.com>
 <20190114095315.GA24495@infradead.org>
In-Reply-To: <20190114095315.GA24495@infradead.org>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Christoph Hellwig <hch@infradead.org>
Cc: "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "ohad@wizery.com" <ohad@wizery.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, Linux-MM <linux-mm@kvack.org>, Robin Murphy <robin.murphy@arm.com>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "anup@brainfault.org" <anup@brainfault.org>, "loic.pallardy@st.com" <loic.pallardy@st.com>, dl-linux-imx <linux-imx@nxp.com>, Richard Zhu <hongxing.zhu@nxp.com>, Jason Liu <jason.hui.liu@nxp.com>, Peng Fan <peng.fan@nxp.com>
List-ID: <linux-remoteproc@vger.kernel.org>

From: Christoph Hellwig <hch@infradead.org> Sent: Monday, January 14, 2019 =
5:53 PM
> On Fri, Jan 11, 2019 at 01:28:46AM +0000, Andy Duan wrote:
> > As NXP i.MX8 platform requirement that M4 only access the fixed memory
> > region, so do You have any suggestion to fix the issue and satisfy the
> > requirement ? Or do you have plan To fix the root cause ?
>=20
> I think the answer is to use RESERVEDMEM_OF_DECLARE without the DMA
> coherent boilerplate code.
If use RESERVEDMEM_OF_DECLARE with DMA contiguous code (CMA), it can
match the requirement, but as you know, the CMA size alignment is 32M bytes=
,
we only need 8M bytes contiguous mem for rpmsg.

>=20
> For the initial prototype just do it inside the driver, although I'd like=
 to
> eventually factor this out into common code, especially if my proposal fo=
r
> more general availability of DMA_ATTR_NON_CONSISTENT goes ahead.
