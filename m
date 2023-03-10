Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2DD6C6FA99
	for <linux-remoteproc@archiver.kernel.org>; Fri, 10 Mar 2023 13:55:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231335AbjCJNzR (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 10 Mar 2023 08:55:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231292AbjCJNzJ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 10 Mar 2023 08:55:09 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B68B10F450;
        Fri, 10 Mar 2023 05:55:08 -0800 (PST)
Received: from [IPv6:2a00:23c6:c311:3401:45a5:b946:dcd1:2820] (unknown [IPv6:2a00:23c6:c311:3401:45a5:b946:dcd1:2820])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: martyn)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 661D7660306A;
        Fri, 10 Mar 2023 13:55:06 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1678456506;
        bh=FVAs9g/17we+OFCvsPpsDFEOfwFHgVpxykYTajeZnY8=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=jk+0ZlsTiH65liU5irk5Bhz2cSeRF04h7VEpCJ8M6o9xmO4xTL4Ga5pCN/sUqb1JB
         dSk2GmB9BmkH61XqufQlONwZODgGaiL2CvI1N3dV/+YmaQSSeNICxuvdajbehHPxaj
         Csr8Jvjew1NOO/vN7VU8SfuU9y2TiZq7pdPIGW+q801JtxkpAzd1IbkiJeSLHZ0P9o
         X9sKdrSLIUDKSMwtLtPH0SRpwzDR30nCJ4YCkPjzc9M+sBzy3RqZSQiwE0OL9FDbcN
         EOPSvQCnpJPp6D+CHDQn8NLMHo4qev+GrBdc2wndxHV4DIlencq1AoAwWpD0sFaT9h
         bVigzsgEOvtJQ==
Message-ID: <0b5ea25e40cad98b2a4f7b098dfa837fcc49e478.camel@collabora.com>
Subject: Re: [PATCH v3 2/3] remoteproc: k4: Split out functions common with
 M4 driver
From:   Martyn Welch <martyn.welch@collabora.com>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Hari Nagalla <hnagalla@ti.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     kernel@collabora.com, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Date:   Fri, 10 Mar 2023 13:55:03 +0000
In-Reply-To: <0d756429-13a5-f894-cf7d-b6f0f04da92c@collabora.com>
References: <20230302171450.1598576-1-martyn.welch@collabora.com>
         <20230302171450.1598576-3-martyn.welch@collabora.com>
         <400ab507-ff2f-cad8-19c6-66818407bf6d@ti.com>
         <a2a51a0a63b7856794ac8fd6889ebf9fcb23f84e.camel@collabora.com>
         <0d756429-13a5-f894-cf7d-b6f0f04da92c@collabora.com>
Organization: Collabora Ltd.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-1 
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, 2023-03-10 at 10:53 +0100, AngeloGioacchino Del Regno wrote:
> Il 10/03/23 10:46, Martyn Welch ha scritto:
> > On Thu, 2023-03-09 at 12:04 -0600, Hari Nagalla wrote:
> > > On 3/2/23 11:14, Martyn Welch wrote:
> > > > + * @ti_sci_id: TI-SCI device identifier
> > > > + * @mbox: mailbox channel handle
> > > > + * @client: mailbox client to request the mailbox channel
> > > > + * @ipc_only: flag to indicate IPC-only mode
> > > > + */
> > > > +struct k3_rproc {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct device *dev;
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct rproc *rproc;
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct k3_rproc_mem *mem=
;
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int num_mems;
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct k3_rproc_mem *rme=
m;
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int num_rmems;
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct reset_control *re=
set;
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0const struct k3_rproc_de=
v_data *data;
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct ti_sci_proc *tsp;
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0const struct ti_sci_hand=
le *ti_sci;
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u32 ti_sci_id;
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct mbox_chan *mbox;
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct mbox_client clien=
t;
> > > > +};
> > > > +
> > > "ipc_only" mode element is missing in the structure.
> >=20
> > That's added with the M4F driver in the next patch - it's not part
> > of
> > the structure in the DSP driver.
>=20
> Martyn, I get that it's added later, but the point here is that you
> are
> documenting something that is missing! :-)
>=20
> You should add the kerneldoc for @ipc_only: xxxx when you actually
> introduce
> the new element... otherwise, this commit alone would trigger a
> kerneldoc warning.
>=20

Ah! Thanks. I'd missed that I'd left the comment in there. Yep, that
needs to be added in the next patch rather than here... :-)

Martyn

> Cheers,
> Angelo

