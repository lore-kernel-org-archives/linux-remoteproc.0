Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED6D229B2E;
	Wed, 15 Oct 2025 13:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760535723; cv=none; b=Dozh6JTJrGNyoBX0FCHdrqDnkFziliXluzTAP7/MNC5ZEJ3K9YUg33+MeerXpNeqUPxbGje3dsKF8JJOwMwrO+QeBwzpkHnMl1Zltk1nrr0Z09nFJbj67MuroC5vFquOjlMerOkSmaqOlvUeMDaYAA8KK560Q1TG6OLDIhIs3XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760535723; c=relaxed/simple;
	bh=QHjYnMKpk+K+1QI3gNRSpIg/WlRlhsW39BNAedvAWCk=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=tMksAkK/2/rXPGzdo4ea/nZ6gbyQWg3C2aV542i+hZUvVPVyKBkchhzLCetOY2r7UeciayV7xoda+0QnxH6eqxXorPLLy2+uOSy8zkJxIg08iac3GI4h6l7yIc608dKyvDNyNT8K8qOkwE0Hq5PxZi9Q03Je0iVDiQ01eMgAWdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=Z8W41eUd; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=qLJr+fOA; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="Z8W41eUd";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="qLJr+fOA"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 5BF447A0122;
	Wed, 15 Oct 2025 09:42:00 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Wed, 15 Oct 2025 09:42:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1760535720;
	 x=1760622120; bh=BYnaKJiuSf33cLfIqDvIV7F5Wm7fS2cDOTMrUdztEMY=; b=
	Z8W41eUdgOJmZNdBMqHrC8Tns2LnWihcTSmiry8QkvGnQyRilJ0DyaIVIh476NCe
	l3cMN2QbixMphF5nsDTzDrnKXvVm9/InC4d6vdwSsu2aoEyUn0a2v4Nu6CAd9kdd
	zjJNszE2NLq4ELpZ3zlqdOy7qQnVHVTRuBYjr/CF+DyWjWvEi7vbxuGBDgl7oRc8
	rmiidsV2Xcf1raMx8BoZ0EN5qUCdm9C5+sqMGyZHrXT2PMmLrY26r2Ehf1rLZ6+m
	/fz7XOtaxrelR8THCHrxUTZChp8rFi6sbco4X9+U9rAh2hrQXd6kuELf7dKRpkMw
	CkNgXv0CtOWGN2k7urcD+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1760535720; x=
	1760622120; bh=BYnaKJiuSf33cLfIqDvIV7F5Wm7fS2cDOTMrUdztEMY=; b=q
	LJr+fOATB77i1UoDYJ2kxzcCw2bjzuDDYQaT3cQdCIF7lnYzDiYbCGTABwD00eMh
	SMbzu/4fiIZprqPYlA5VY3QQHkd5S/INDNnR5A0r8iBrSOEC55Do+b1S0h2Te53w
	eejvnad2XQGzT1iFdIDOvTEkKn5Ukt1GLeT3CpmJchv/Z9rfQoRyulBOmAYpSOhX
	fHeE0T15sbOs/DxGbSlcFaPf2wiZLDzU28/LybCSUnWcOeGjW4PmMfsZ7ZuySgf6
	4rrM6ghU2jhCzc2YeWQzRuCCLGD6Mi0cIBiTS+yaBoCL97kLE9CKbCbaDd9EyvCY
	rK8bI8b5DRs77ySGjCSCQ==
X-ME-Sender: <xms:p6TvaC6ye3TJbDtGaQiUZSlHawLRfoxuMC4CNTUvTFK2ubaz4smoQw>
    <xme:p6TvaGsFt7znWv3O-Qvpe-rTxXuktBWy2d76kVZ_epS8R7DlL2RyVNfvNx_HbvBTA
    gGEMR856W-NGRlDMCRLC9gTNtNr_7kd2wBmGmiq8x9jor_4Go5i-jo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduvdefheeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepfefhheetffduvdfgieeghfejtedvkeetkeejfeekkeelffejteevvdeghffhiefh
    necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgt
    phhtthhopedutddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepfigvnhhsthestg
    hhrhhomhhiuhhmrdhorhhgpdhrtghpthhtoheprghnghgvlhhoghhiohgrtggthhhinhho
    rdguvghlrhgvghhnohestgholhhlrggsohhrrgdrtghomhdprhgtphhtthhopehkvghrnh
    gvlhestgholhhlrggsohhrrgdrtghomhdprhgtphhtthhopehmrghtthhhihgrshdrsghg
    ghesghhmrghilhdrtghomhdprhgtphhtthhopegrnhguvghrshhsohhnsehkvghrnhgvlh
    drohhrghdprhgtphhtthhopehmrghthhhivghurdhpohhirhhivghrsehlihhnrghrohdr
    ohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrih
    hnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhmvgguihgrthgvkhes
    lhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvg
    hrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:p6TvaBHNKnVxvA4B7hOIhVtCul9uXfiSGWmrglzje3bwxBTbnMkk0g>
    <xmx:p6TvaEkcm4NXqSwJus1Ky3jFT26RsL7n7F4wld23SJpafqj0XR7Cuw>
    <xmx:p6TvaMfkDr06akdUCPnW3KfN1W7g0t61WypctFLh6SRzFv4b1v3NFA>
    <xmx:p6TvaKEFO1EyMlfBAqLE1L4IEHWZqJeTJg4eN8x3mPzMnw2-SP28Og>
    <xmx:qKTvaA6CcYQI_7d-v5lCFoQTbsV8HHuzART7r0eJRreAVCvRa1GIlar7>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id B441B700065; Wed, 15 Oct 2025 09:41:59 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A1uT7sOefpDB
Date: Wed, 15 Oct 2025 15:41:39 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 linux-remoteproc@vger.kernel.org
Cc: "Bjorn Andersson" <andersson@kernel.org>,
 "Mathieu Poirier" <mathieu.poirier@linaro.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>,
 "Chen-Yu Tsai" <wenst@chromium.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
Message-Id: <3f23850e-f01f-4a2e-a7dc-82c04ab5926c@app.fastmail.com>
In-Reply-To: <20251015084103.10737-1-angelogioacchino.delregno@collabora.com>
References: <20251015084103.10737-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2] remoteproc: mtk_scp: Construct FW path if firmware-name not
 present
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Oct 15, 2025, at 10:41, AngeloGioacchino Del Regno wrote:
> After a reply on the mailing lists [1] it emerged that the DT
> property "firmware-name" should not be relied on because of
> possible issues with firmware versions.
> For MediaTek SCP, there has never been any firmware version vs
> driver version desync issue but, regardless, the firmwares are
> always using the same name and they're always located in a path
> with a specific pattern.
>
> Instead of unconditionally always relying on the firmware-name
> devicetree property to get a path to the SCP FW file, drivers
> should construct a name based on what firmware it knows and
> what hardware it is running on.
>
> In order to do that, add a `scp_get_default_fw_path()` function
> that constructs the path and filename based on two of the infos
> that the driver can get:
>  1. The compatible string with the highest priority (so, the
>     first one at index 0); and
>  2. The type of SCP HW - single-core or multi-core.
>
> This means that the default firmware path is generated as:
>  - Single core SCP: mediatek/(soc_model)/scp.img
>    for example:     mediatek/mt8183/scp.img;
>
>  - Multi core SCP:  mediatek/(soc_model)/scp_c(core_number).img
>    for example:     mediatek/mt8188/scp_c0.img for Core 0, and
>                     mediatek/mt8188/scp_c1.img for Core 1.
>
> Note that the generated firmware path is being used only if the
> "firmware-name" devicetree property is not present in the SCP
> node or in the SCP Core node(s).
>
> [1 - Reply regarding firmware-name property]
> Link: 
> https://lore.kernel.org/all/7e8718b0-df78-44a6-a102-89529d6abcce@app.fastmail.com/
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

This looks good to me, thanks for the changes!

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

> +
> +	/* If the compatible string starts with "mediatek,mt" assume that it's ok */
> +	if (!str_has_prefix(compatible, "mediatek,mt"))
> +		return ERR_PTR(-EINVAL);
> +
> +	if (core_id >= 0)
> +		ret = snprintf(scp_fw_file, ARRAY_SIZE(scp_fw_file), "scp_c%1d", core_id);
> +	else
> +		ret = snprintf(scp_fw_file, ARRAY_SIZE(scp_fw_file), "scp");
> +	if (ret <= 0)
> +		return ERR_PTR(ret);
> +
> +	/* Not using strchr here, as strlen of a const gets optimized by compiler */
> +	soc = &compatible[strlen("mediatek,")];
> +
> +	return devm_kasprintf(dev, GFP_KERNEL, "mediatek/%.*s/%s.img",
> +			      (int)strlen("mtXXXX"), soc, scp_fw_file);
> +}

This might have to eventually support version numbers, in case
there are ever incompatible ABIs where updating the firmware requires
a minimum kernel driver version.

Until there is a firmware file that needs it, this code is
fine.

I'm not sure if you need to handle the case where there is
a "firmware-name" property in DT, but the filesystem only
contains the generated filenames, or when the generated
firmware name refers to a newer version. It may be best to
try both the generated names and the name from the dts
file.

       Arnd
