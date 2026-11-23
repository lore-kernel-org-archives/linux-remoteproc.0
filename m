Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795443077;
	b=4cHYZX/fy3sO5hzygj2i5XyLeeektLDHmajwcQWni0ntFTzrz5/fw+jzIf48TGi18m4Q
	 7T+A/rx/620YSpVPi6NqTD3OmBoJx0S3MqyXwyJVwHKl+TzwiWYWXyt7CMVTnJBRwS7Jf
	 0tO5EOEh8zJuevDDA9CHX0UlS4N9As0OdWotGmCmU7s3p2pQdejwQEoqTzDXSDbNiK/0n
	 vSSXs41Lu9BTO38+PnJbIfwiTx2ExLCOpqXFSKTUm73WjBFxSpM+oWgNC9JEBpiBdKnHe
	 FucxMd6MfSG6zuxojbCE8E1gWazrI3/ONXs8cbGjGTaOSt2t7VGmoRzSW3qA8OYnZoQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795443077;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=R32xhf3Kvq/DaeS/L7g8lPdJxhRkFnoaSwXaedjNBvc=;
	b=J31I0i596b2m8uzx87V1pKFUBZtlDrliVu5rZmUOcLZEx1LfJ+4ogXZ94BI8HT44DjeW
	 Gb9hi0/fAlwuIr4/NQQJlW/7AC8n0R2H056JycVnhh8NtqBJtuSd2HTL9T6Xo0z3KDf/g
	 KzuayNEhF8XbctJeJNoHOujBMVbvyKMBDdIO7EqQO/oZyp7dISHm28OAUkZVJ1UD0gL8o
	 Q7lBF83rdgHC2THKo8jt3IPOFDgLn/KxpD30Ruwwq8+g0qSBctTPQRTexmf5+MWPgXy6b
	 /JHcPRJumejxGy+Inqr8gy90FsD1H5yfLk9alAP+cwFmIKyWVUrkzSOB+ZtkbGeNmiA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="oJQDP7/r";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98FFF606A327
	for <linux-remoteproc@vger.kernel.org>; Mon, 23 Nov 2026 14:11:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98FFF606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=oJQDP7/r
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b10d24345dso29102777b3.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 23 Nov 2026 06:11:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795443075; cv=none;
        d=google.com; s=arc-20260327;
        b=VNrbrtSlojQJwCQUPc3RD6MhvhWncB2zj7GaIOzFtU5ouzBnhXMmF0wLLlheqsaYIA
         YD3VNr8OtuVxwdiiocmgbm5ZDY0zkfYsZBqs6grfvBRo6WCTumnWMS9W0dU5vTJzfAer
         pJrr4MG/AO9qp5qCASJmXeqejYYDMoKs54b1ffoL0YsmCRa2RAO+09QdafVZIvPxuLho
         RH8aGpUAJpbK+wuN/GUarkuUoGub9qEX3rubu++uOkAim/iUkhwgGZerVB/mtTtWzHXI
         4x3oFc6N23gI+TO09kLmAddCkx6FJ0K9n9xuQgYIFSlBoPmsAA/HTgeolclKtMxGKxys
         yjcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=R32xhf3Kvq/DaeS/L7g8lPdJxhRkFnoaSwXaedjNBvc=;
        fh=c3YJhLuIyh8uWkTOGlBYqnFhaQYYRYnzjoPRrjn33AM=;
        b=LRDzLpD97NGnGc2tEqG7JNM21Ngiyq1YFpig3+LdL+0KnvtD1m/Lo9dSId8IpI2Dvg
         cIsv3rXcs6KH7Xc+KdTndrU/1BkAX+8JapeWDV3Sl37YXz6hSlPF9PXVh9CRnyizLQfo
         e6Qwb2SbCJwM/cYO+GBt9StH/DiPZ4nbsBbIG858/RVyiGFgOeMKTPgesyc6pciulyKd
         f+gEHyJ0ieDNvwMRiPh0smMXsUgx8omBpGyki+hGKE4P53kVwRk+STtewEuW/77rKO2O
         3LyYM0TQ9IZhcNCIamdZrrp3cMH/ngK1dis0wz37uL9IoGEWCYGZZ6AIzbZyqwbXAgZk
         OwAg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795443075; x=1796047875; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R32xhf3Kvq/DaeS/L7g8lPdJxhRkFnoaSwXaedjNBvc=;
        b=oJQDP7/rjnJYrd0cLBz1J9ztheI2i7Vp8nI+v4fQe/y+5krO8t32ZmSQPH/iwuMQpm
         vQGEzln+CAf/Ls9QXAPdsJbYCZlK4OpqYet8Q8ou4yINw+jejSIlBhNhXlaQkHcXpBkX
         Y+ex75Dzy21OVQtH9xkHQVReDNd2HaZ73Sd6iDQ4Rv9XzO91ct3S0QNHjfCQUPQ257xq
         Ejj2qDBYG/oU+uhesOvkmns+pcorqf2cMwFYlP3Hy0eMt6nacRpJe5aCOvF8Xd3mm6Xn
         o23ES+cpSCuHc7Ltsupnzy/wiaMwr7v1h3whRzDbqL755Vj3G6jyKcXwhO0GmKYvUVOO
         DpTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795443075; x=1796047875;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=R32xhf3Kvq/DaeS/L7g8lPdJxhRkFnoaSwXaedjNBvc=;
        b=NPB8cezS4NX6FVjRY8BM/2Wgz7r5LSv4t8suOU+WQXffVIXXd6nkpUrt/HyD9T1SeW
         riinz5T/ZyMEtc2frWOYTn4nM8xFv/ZMQHH6gQvR0t0VkuFyXT9GMRswrd6trrOzTTt/
         111cuN08PNsAEF59FSWUpe5WkiILK8ydTl7rxRCwwnXD2vWjZULNUO2lp/5jm0l3KgP3
         TDXvrc10wxhidOUGtM4rlwp4WY9iayyjtjdp68Mv9VOVfGpLKLd1AjbSGaYo0GwOS6mW
         LzHyhMS+QxSpcW4CufjQd196F5MgrGanyDMl1yN8nj9KpnjkTCim1UI7bsTiO+8wQO5C
         mTFQ==
X-Forwarded-Encrypted: i=1; AL+hErEIF2sivwvQ2+dZ5TEBWyDWRkX2MNEPHENl/vT8Ns8JEtOhnNulDK6Smeq44BpaB2N2UbJLFLYJqGjduK2rQVi8@vger.kernel.org
X-Gm-Message-State: APuU4Z9iZqxlMJ6GT7QvzRS7A1pyQSmF5z37Ar4y35RRwnA+HgLys348
	7PUEH8+lsBJf72NOU4wr16S2/0PWm/793eA4KhlIkDIIrFcsDSAYrp4aQL7Ba5A7WVWcMHvu7ZX
	4kJ8HTVcnvDjYfQO0JyYbKw3uaOm8iGa+TRuvX1+1Cw==
X-Gm-Gg: AZFdTZehH33sIJzUAk724rFe+hutswINxDhLnZl+hmmiunHzrdTooq6Haq+OKPxQaD0
	oL1sdmDtWrN9zkHDShm9lggBfYo4fXp0nahRgOK33JptX5Se/z5G83eaIdoTJ31YWYRUEVOb1mK
	EHptiK8DQdeTpx93gaGglHrH4Cevwc7gk4/sH+MouxLv8hVNMfiP9J5ufUbKQTLAyuYqaTdIgZD
	hM+5piu1JknhBDLbvGUCaOouCrs046bIg6fzG6FN4FJHo71sJYhC6wpyIhbtxTJzJ0uyrPqNR8t
	Vwmdq9Upz+pINLMxy/bvnwagAR5BFL2xUBnJIUwoSr0ivNmCEsTMYY8q1HmG1PH0ug2PAR9srFE
	ljzDnODraQB86g38h/t68SElJVA2laNtqk+tvmJOmIVr+knPml9H5eF9oAunudZS4ijJSiUY=
X-Received: by 2002:a05:690c:6b07:b0:8b5:61d:f3ff with SMTP id
 00721157ae682-8b5204e9571mr53022067b3.46.1795443075492; Mon, 23 Nov 2026
 06:11:15 -0800 (PST)
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110-imx-rproc-free-mbox-v1-1-3e33ff98570d@linux.dev>
 <avMgJNyGez2Eyr3a@nxa18884-linux-1.ap.freescale.net> <awPmc_4VFkcpW0C_@bombadil>
In-Reply-To: <awPmc_4VFkcpW0C_@bombadil>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Mon, 23 Nov 2026 08:11:04 -0600
X-Gm-Features: Aa3M54rmzuqQaag6_hKersoZSWqoaB26gF7bb-M07qfK52BJ_PrHvuWnVFcXIfA
Message-ID: <CANLsYkx=M_TXN10qAcQC0be065TYnzfOae6E8ss-9DTj9MzogA@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: imx_rproc: revert channel freeing order in imx_rproc_free_mbox
To: Richard Leitner <richard.leitner@linux.dev>
Cc: Peng Fan <peng.fan@oss.nxp.com>, Bjorn Andersson <andersson@kernel.org>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	weinshec@holodeck2.de, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 23 Nov 2026 at 01:09, Richard Leitner <richard.leitner@linux.dev> wrote:
>
> On Tue, Nov 10, 2026 at 09:46:12PM +0800, Peng Fan wrote:
> > On Tue, Nov 10, 2026 at 01:29:08PM +0100, Richard Leitner wrote:
> > >The imx_rproc driver is affected by a race condition in the shutdown
> > >ordering in imx_rproc_free_mbox(). A received message might cause a
> > >virtqueue_kick resulting in tx_ch access. When imx_rproc_free_mbox() is
> > >triggered between the if (!priv->tx_ch) check and the mbox_send_message()
> > >call in the imx_rproc_kick() function the mbox_send_message() then tries
> > >to dereference a NULL pointer on the tx_ch (as seen in the call trace
> > >below).
> > >
> > >Therefore fix this behaviour by first freeing the rx channel, so no new
> > >messages are received and therefore no kicking on tx_ch can happen.
> > >Afterwards release the tx channel.
> > >
> > >This problem was encountered on a fleet of i.MX8MP devices on about 1 in
> > >500 system shutdowns, resulting in Oops below. This Oops was recorded
> > >from a v7.3.0 kernel before the work-queue removal.
> > >
> > >    remoteproc remoteproc0: stopped remote processor imx8mp-cm7
> > >    Unable to handle kernel NULL pointer dereference at virtual address 0000000000000008
> > >    Internal error: Oops: 0000000096000004 [#1]  SMP
> > >    CPU: 0 UID: 0 PID: 32710 Comm: kworker/0:1 Not tainted 7.3.0-XXX #1 PREEMPT
> > >    Hardware name: XXX (DT)
> > >    Workqueue: imx8mp-cm7 imx_rproc_vq_work [imx_rproc]
> > >    pstate: 40000005 (nZcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> > >    pc : mbox_send_message+0x8c/0x178
> > >    lr : mbox_send_message+0x88/0x178
> > >    sp : ffff8000897f3b70
> > >    x29: ffff8000897f3b70 x28: ffff80007a07b248 x27: ffff0000d90e1a20
> > >    x26: ffff80007a07b328 x25: ffff0000c1d31300 x24: ffff0000d90e1a40
> > >    x23: 0000000000000001 x22: 0000000000000005 x21: ffff8000897f3ba4
> > >    x20: 000000000000000b x19: ffff0000c1b24240 x18: 0000000000000000
> > >    x17: ffff80006a453000 x16: ffff800081ac8000 x15: 0000000000000000
> > >    x14: 0000000000000040 x13: 0000000000000228 x12: ffff0000c115a3e8
> > >    x11: 0000000000000000 x10: 0000000000000001 x9 : ffff800080cd6570
> > >    x8 : ffff8000897f3ba0 x7 : 0000000000000002 x6 : 0000000000000000
> > >    x5 : 000000000000000c x4 : 0000000004400000 x3 : 0000000000000000
> > >    x2 : 0000000000000000 x1 : ffff0000cb268000 x0 : 0000000000000000
> > >    Call trace:
> > >     mbox_send_message+0x8c/0x178 (P)
> > >     imx_rproc_kick+0x50/0xc0 [imx_rproc]
> > >     rproc_virtio_notify+0x3c/0xa0
> > >     virtqueue_kick+0x4c/0x68
> > >     rpmsg_recv_done+0x224/0x658 [virtio_rpmsg_bus]
> > >     vring_interrupt+0xbc/0x158
> > >     rproc_vq_interrupt+0x40/0xb0
> > >     imx_rproc_notified_idr_cb+0x20/0x40 [imx_rproc]
> > >     idr_for_each+0x74/0x100
> > >     imx_rproc_vq_work+0x2c/0x40 [imx_rproc]
> > >     process_one_work+0x194/0x520
> > >     worker_thread+0x19c/0x320
> > >     kthread+0x134/0x148
> > >     ret_from_fork+0x10/0x20
> > >    Code: 37f80574 aa1303e0 97ffff39 f9400a60 (39402001)
> > >
> > >Fixes: 99b142cf7191 ("remoteproc: imx_rproc: Request mbox channel later")
> > >Cc: stable@vger.kernel.org
> > >Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> >
> > LGTM:
> >
> > Reviewed-by: Peng Fan <peng.fan@nxp.com>
> >
> > BTW: would you plan to fix the other issue that sashiko reported
> > regarding imx_rproc_xtr_mbox_init()?
>
> Thanks for the review and sorry for the late reply.
>
> Sure. Should this be a separate patch or added to a v2 of this series?
>

Please send another revision with the fix.

> regards;rl
>
> >
> > Regards
> > Peng
