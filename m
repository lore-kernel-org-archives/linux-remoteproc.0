Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD719340294;
	Thu, 30 Oct 2025 09:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761815460; cv=none; b=TIx8nvunqNFDnpaLtxqKrTaTD4NfaSodU2rpJXKIHD/OJfSxo37rBnuVxyjVrorPZ3pe7qGHzSmJCTdF2qDoHIAX786IrH2po9JKOChR/HCzy/GOTL58p9FLgPPn9nAMgFurCMwhydnPn+gimvZZyTDYAE39o2Re+6n9xW7Ray0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761815460; c=relaxed/simple;
	bh=LwImtIic5S4WdFUw4zvNryLJBfpSk1GZjFAPdn+xADs=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=uZCTL5ti0ChsrJIpszVnQUQn/Hho5HrkWRIDOABM+iZt7I8LBsv/YdZ45r3ZXuFCM5+4zze1h/cCJsyWgQUuLwAD5KvJVex7yjPbcIIswaJ7Cen/GQPYtfvyn7JP2xpZ3GLXKIcnCGDtdW9RagNvI/0a/iru7ZP9zYFPDQmJ7LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=G2IQJO95; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=L3ey6p+1; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="G2IQJO95";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="L3ey6p+1"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id CA3CE14001B2;
	Thu, 30 Oct 2025 05:10:57 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Thu, 30 Oct 2025 05:10:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1761815457;
	 x=1761901857; bh=tb0V2rWF8eK5noQCPf0SL+1neAJPUMgNFsms4dB+ol0=; b=
	G2IQJO95adkPHgL2RfFliPL7gFRAaAg5OtYxLBIfNxL6pb8jgmaQw5iHi+PTwB/1
	Vi0uKCr977vPjTQ5eQ4qqW1gQlZBDUAtKVlJEu/CdokvPpZxyMRbp5ohwnR6J3bN
	lCwwR1em5n16nPrx89XEHmqlYZTjfjwyeOZfFrSnaf2XZ4lkfFgTqIESaXbVP6iL
	lZnkQEdOYgwEmOtRp6M3EK+XQpl76EOw1wFbyqQoxVGkXl9QdnRZveW0R2NGkxVS
	oxTWMXsysOGEFS6PyZytYeuzEo/9QolWjNItIF+d7Q7XJNbcTLHN3Pzqbftn+b1e
	qqg+I7u0ra2vaQPawxyx0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1761815457; x=
	1761901857; bh=tb0V2rWF8eK5noQCPf0SL+1neAJPUMgNFsms4dB+ol0=; b=L
	3ey6p+1i2RRBrNpVwE/AI9rUWRHZasfr2ezQxr6UwMWVWrMlmyMjPCvGSTsAWo+W
	1/b09Ug3Z7mEfj50zKmxvpGFyPXF3B8+t8Rwj1gsZ+M6kGB/DP4aJKcxur3PgyIp
	fWE29kr1BMADTO1SxOe0gxbI+V+812cQ7CxzXgKYwDIKdFrmgDMON3TqFf3qVM5p
	QI2Vb94WY+I35hMl9LS7EfI81Ak9i3VSFKKTStL2YrXEYYggb6mGjWumNMo/OUTm
	7dZl/pBOF3XZGSb2uq2pK7RgMNCqATH3ujTezCWXvykz7EZhgmeoGmu1v76MvcWi
	wV0awuTuES7+yi0gxgtDw==
X-ME-Sender: <xms:oSsDabVPrIrTAdK_m5JigryzDqTJVooQbuI_XrkyLlusjclGGdAepg>
    <xme:oSsDaeZhZSc4TnJ35k38hvg0zJnRQMaRNOPI2tBhQ2gjO25sWUwvzMLKtYjcFNNys
    8Gk9nD9s6HFSZq-_vHpiXqbotvqiOS29gvLA40TiakvO9T5cdnVIveb>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduieeivddvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepvdfhvdekueduveffffetgfdvveefvdelhedvvdegjedvfeehtdeggeevheefleej
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepuddtpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopeifvghnshhtsegthhhrohhmihhumhdrohhrghdprhgtphhtthhope
    grnhhgvghlohhgihhorggttghhihhnohdruggvlhhrvghgnhhosegtohhllhgrsghorhgr
    rdgtohhmpdhrtghpthhtohepkhgvrhhnvghlsegtohhllhgrsghorhgrrdgtohhmpdhrtg
    hpthhtohepmhgrthhthhhirghsrdgsghhgsehgmhgrihhlrdgtohhmpdhrtghpthhtohep
    rghnuggvrhhsshhonheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrthhhihgvuh
    drphhoihhrihgvrheslhhinhgrrhhordhorhhgpdhrtghpthhtoheplhhinhhugidqrghr
    mhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoh
    eplhhinhhugidqmhgvughirghtvghksehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
    pdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorh
    hg
X-ME-Proxy: <xmx:oSsDaWB9qRfihMri8moXwHla_MkZk0GCsxLCxQ2gXBbQ0Mr5TvNOIA>
    <xmx:oSsDaewnx5C0FXH3B4xhDmLLOfzFlFDuMJ6zbBvYV-nIzWbxsiOXqw>
    <xmx:oSsDaS5LiP9Tuuc7OO14BJkDjhsLQyWVBzY56kbZ6v3vKgNerK1j3w>
    <xmx:oSsDaXwp4GkDZ5eFt32DUXgSKHuva78C0j57vuM2rhTuQ06fUCQ97g>
    <xmx:oSsDaSnin9clfra-86r2dbBeGWJnhtq8OAB7muA_mrNh8B9qgws6CvnM>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 65CD5700054; Thu, 30 Oct 2025 05:10:57 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A1uT7sOefpDB
Date: Thu, 30 Oct 2025 10:10:37 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Chen-Yu Tsai" <wenst@chromium.org>,
 "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
Cc: "Mathieu Poirier" <mathieu.poirier@linaro.org>,
 linux-remoteproc@vger.kernel.org, "Bjorn Andersson" <andersson@kernel.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
Message-Id: <f434165f-1717-41ff-93e4-9be5b7fca929@app.fastmail.com>
In-Reply-To: 
 <CAGXv+5Ge-uZHKATOvqQF25DRTcHFJkopUk-JUXDtpEen=BwCiA@mail.gmail.com>
References: <20251015084103.10737-1-angelogioacchino.delregno@collabora.com>
 <CAGXv+5Gs5_j5L3+HT7K-XYwVG6S8ZGhHZkEcS0HpdkcjRQq2oQ@mail.gmail.com>
 <9f5a3dc5-d0f8-4172-a4b4-867919612a2d@collabora.com>
 <CAGXv+5Ge-uZHKATOvqQF25DRTcHFJkopUk-JUXDtpEen=BwCiA@mail.gmail.com>
Subject: Re: [PATCH v2] remoteproc: mtk_scp: Construct FW path if firmware-name not
 present
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 30, 2025, at 09:21, Chen-Yu Tsai wrote:
> On Wed, Oct 29, 2025 at 7:05=E2=80=AFPM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> >
>> > I guess I can send a followup patch?
>>
>> The only followup patch that I deem to be necessary is one adding a s=
ymlink
>> or renaming for MT8188's SCP and nothing else.
>
> The firmware was uploaded in March of 2025, and is packaged in Debian
> Trixie, and was also backported to Bookworm. Either adding a symlink or
> renaming it won't trickle down to users for some time. So this seems
> like a possible ABI break, where the ABI is the file name.
>
> Or maybe you don't consider it as such because SCP hasn't been enabled
> in the kernel in any release yet?

It's normally up to the kernel driver to know about the firmware
file names and the order of trying the possible fallbacks, which
is exactly why I originally asked to not rely on the property
from dtb.

If you want a symlink in linux-firmware, that would go the other
way, pointing the old filename to the new location.

    Arnd
