Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 356D6C63777
	for <linux-remoteproc@archiver.kernel.org>; Fri, 20 Nov 2020 16:07:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D60F322253
	for <linux-remoteproc@archiver.kernel.org>; Fri, 20 Nov 2020 16:07:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725805AbgKTQHP (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 20 Nov 2020 11:07:15 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:60873 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725766AbgKTQHP (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 20 Nov 2020 11:07:15 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 0667A5C0055;
        Fri, 20 Nov 2020 11:07:14 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Fri, 20 Nov 2020 11:07:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=4CUe3OsuPZ5KB0JzgYMc3vAw7fo
        yq05iJjll0KKQjbA=; b=BXihaJdiTyTPjGuv2aij1PbrTDwehYtde2OkkD45NoD
        RmbvrK2LT5w6wdqtlHOXKLJPP1jwuwBvuW7iPxESqQ2bnhbYlAmBzsbH/t7ndrVc
        xSRW0tlfF7aMJtuhFzjYniwN5AeWCBCf9TSipOYeDVmwFfffOhl/3mmO+TnWFOpu
        BOqebh1PwgV19j+TkjbOUpwQ4W/ThsD3kgNDLJsoiyuGxPMUAXkZIt08uT/wLSjP
        +1FPDrzZ01nASVtcIDf4/C3wBlgvx82roIsGNJvo3YWK0tCBNZwNJkvbDfmYIBVK
        A9EqgtuV95xZ8lfZWy1lFX6bAZtxGMXQ3b7Ef/3cOiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=4CUe3O
        suPZ5KB0JzgYMc3vAw7foyq05iJjll0KKQjbA=; b=TKLarjNUTItoTQkJvHK15S
        N6zesRn/CcQbok4G9b81z1aLRQSv18HvGoO84AyvbH3odw3o56xNT1Ap2u6fck04
        J7xszlfhox8RYKNRNvIw7Cqp5X7D+N05Mt+DllBO/yin6VFvH8LEiSkYjdoIpBQB
        VMUIIZ7gr5wJ4FZPURz8VnPyCsMLdTH+Z5hBOfwXtJuB6sEeexRlHBcwFZQHF9V8
        j6J5dzvj5ulmXTHM0SES1+gl8RucxiYxsx2mNJnPB/UP6GqXEjDQHubRSYMJlE/U
        N00qUHQOWArIZZl0fwDgM/DFjRvOwFDyhcqTiEfZd1VpAUJMXyw7ocAJXHEKIR3w
        ==
X-ME-Sender: <xms:sOm3XxPfx_Lu1EtJ_U6M1e4a11sr7iLiT431lQsD8Ncj2cip8KScnA>
    <xme:sOm3Xz8p_1iYmbG3cvNi8YUrshWunwYYZCFzUTz8PfXHQI50LLS99lXS4PG1K8fF8
    pnQ0AHQvxqA8IRiwfY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudegtddgkeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesghdtre
    ertddtvdenucfhrhhomhepofgrgihimhgvucftihhprghrugcuoehmrgigihhmvgestggv
    rhhnohdrthgvtghhqeenucggtffrrghtthgvrhhnpeevveefffduveeitdegtefhhfetue
    ffteefffdvheevvdehteethedvleffgfejvdenucffohhmrghinhepkhgvrhhnvghlrdho
    rhhgnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:sOm3XwSCJ8MVck9Gwi1ij7xSkoFBN2aWLqQ46MGm5_21DzJbjxfm8w>
    <xmx:sOm3X9tfNS9GKf_s_1muG-8YHQ3f33mzmVepXBAa2hZN5akcCwVI_Q>
    <xmx:sOm3X5dWAJIciPxHdiZiinL3FxzNZy94DhiepfgXW1_dCdKxkfv_IQ>
    <xmx:sem3X5FraDdWBJ2mNSOvb4rA4FpdEGHV3HZpK8L-0Gjmk17VOrOAQA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id CA13E3280066;
        Fri, 20 Nov 2020 11:07:11 -0500 (EST)
Date:   Fri, 20 Nov 2020 17:07:10 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     fuyao@allwinnertech.com
Cc:     wens@csie.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] introduce sunxi hwspinlock
Message-ID: <20201120160710.wlkl5cdfqlrym2fj@gilmour>
References: <y>
 <cover.1605767679.git.fuyao@allwinnertech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="wvdbsbhph2y6vxbz"
Content-Disposition: inline
In-Reply-To: <cover.1605767679.git.fuyao@allwinnertech.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org


--wvdbsbhph2y6vxbz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

On Thu, Nov 19, 2020 at 02:44:51PM +0800, fuyao@allwinnertech.com wrote:
> From: fuyao <fuyao@allwinnertech.com>
>=20
> this series add hwspinlock of sunxi. it provides hardware assistance for
> synchronization between the multiple processors in the system.
> (Or1k, Cortex-A7, Cortex-A53, Xtensa)

Xtensa? Which SoC has an Xtensa core?

Unfortunately, there's been a submission of the same driver earlier this we=
ek:
https://lore.kernel.org/lkml/cover.1605693132.git.wilken.gottwalt@posteo.ne=
t/

It would be great if you could point out whatever issue there is with
that patch series (it looks like the retry delay could be useful for
example).

Thanks!
Maxime

--wvdbsbhph2y6vxbz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX7fprgAKCRDj7w1vZxhR
xffJAQCaE5uHPjtJHu2/qTK2U4iyIBEO9mGgMR1pi2r8kwQ8BAD/RwifMTitHOEd
lrcNueEDkhuO9gIH9a3haGBBuQsWWA8=
=VDdt
-----END PGP SIGNATURE-----

--wvdbsbhph2y6vxbz--
