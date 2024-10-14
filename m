Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A021AAC4;
	Mon, 14 Oct 2024 15:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728920616; cv=none; b=AFDfoaKyj3PzI+5XV0W3huwVKSlZosmzXP8CM+byB1iosT8cki8JtxEu+YWHTb4I5rADMGdokYrY6V6P2hsfivDKMtFM2J9Tjxw3Ud/I7MENebeNaJrZmYoHP9oTGxEicYjVGpgCW7ax2NPjljUH5vb3jWxQuHOioAXNjPdOFbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728920616; c=relaxed/simple;
	bh=hgsXsOcp3OQh7B3lbb5dpw8btzJApolsWcbgSFCCI9U=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=LpLH7mzRhMMnW8fER8LxGjiuuigHntZMFn6oRNqJYJwK46KfLxOS8HWOyhZZh/vbCMOUs7N+Dlt17I7CZavi5RsIeerqQMLCCdBYRcpRl6bcqJACg88vIJBV4nMBqkC3n+4dYeTPzHRJilLUkaHmt4S/22rccGHAare65sbiE+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=jru7JLFj; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Uwh9+gcG; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="jru7JLFj";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Uwh9+gcG"
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 2AA361140171;
	Mon, 14 Oct 2024 11:43:33 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Mon, 14 Oct 2024 11:43:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1728920613;
	 x=1729007013; bh=CG7LSN+EM/lAaMmJIOnT+Q9Bg9sRCT6XCqzcRBY41EM=; b=
	jru7JLFjlhjK0pSS0xjjDrbyWzCJShEjSO7iA3NxmlquXO3x6NwlTJpQk5GM91ce
	Bl0vBs70J7aLJ6ZbooxKbfHIB56As89ePrnxvglge+ANbE6HfaDYPY0oD4/1O0+X
	40VkoyDr2fyR9Bx9dRB5ZEGo0oUNwvF4V1TPQvyYVLVjXqjRjbxdWRhKOCipa0RY
	rj5+1qgwSAfuQw1IJyfiS8xIGM0fnLhMW+AJR6SjYaLbb5AJ1ff5GKQ+W5LYa6Gi
	Sy7smXwR9IcIYG2/RusheGuWuHmgWFIrFRLrLxq85caFw51OE5APFWwBu45F13Wq
	D9xql3ArBW0+RizD1r+7JQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1728920613; x=
	1729007013; bh=CG7LSN+EM/lAaMmJIOnT+Q9Bg9sRCT6XCqzcRBY41EM=; b=U
	wh9+gcGR1d5IDbS2QbsBVDColEBR2ytdTlBIeVJdBX2ArLPXf2KLlkKqfgC8ws8B
	+p6BglZqxH89YJ8eYyCQjUX9grxqwypZ1bIqEUf/y7BegVHqjgrN0RweyGfGB5gx
	fAdhP9COWrjMFbPNYfA/YgKAdiL7ogvvNFddITi0TOKjhmpz9irGcFhIj9Ph+XAW
	3KdNt6LxQ7M9DiRSug3vGt+nmwkDYNTqIzBFs2O0esbkC7LlWVvKRRucpd+peUwF
	JjXwY5FogO41lvc5qbNjsKJi/x5aDWFwolTV07uD+wI7mC5a/lIoR3IeXcgkkZWv
	f14FNH37Ri1LP/chRn6bA==
X-ME-Sender: <xms:JDwNZ-36eWakExPGOdPLCqWQtXxxB3p8qD-yh0IUqH-94glUAljokA>
    <xme:JDwNZxHh0ln158vTJhsr8iUyiefH63GC2SdSO2i2c_op-kaf2BJwbIJICprENUCBy
    cLUBWSElmWn_dF3vJI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdeghedgledvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
    gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepuddt
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrghrthihnhdrfigvlhgthhestg
    holhhlrggsohhrrgdrtghomhdprhgtphhtthhopehjrghsshhishhinhhghhgsrhgrrhes
    ghhmrghilhdrtghomhdprhgtphhtthhopegrnhguvghrshhsohhnsehkvghrnhgvlhdroh
    hrghdprhgtphhtthhopegrrhhnugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgr
    thhhihgvuhdrphhoihhrihgvrheslhhinhgrrhhordhorhhgpdhrtghpthhtoheprghfug
    esthhirdgtohhmpdhrtghpthhtohephhhnrghgrghllhgrsehtihdrtghomhdprhgtphht
    thhopehnmhesthhirdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvgh
    gvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:JDwNZ25yC-b5M8byQkJuIcfcLhertGVgxdR6mxFJEe1nAib_CCCauA>
    <xmx:JDwNZ_34-WG3lHJpd09tcwHVbafdBjThDqEAhTBUb_WCAtLZmL1F7A>
    <xmx:JDwNZxEWonjsNGWzzuB1AMDoXft_p1Tka8rGzRRETxS4yHcS5e-w7w>
    <xmx:JDwNZ49HaZPVlP2rt22CZd-7X_wMBl5wO6B5j9zRbVP--uhhFgOy5Q>
    <xmx:JTwNZwBTI6RT3hZ71rG5_45DUj-OOB21cd7Q12usXhnRp4wKVTc8cBO3>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id D870A2220071; Mon, 14 Oct 2024 11:43:32 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 14 Oct 2024 15:43:01 +0000
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Andrew Davis" <afd@ti.com>, "Arnd Bergmann" <arnd@kernel.org>,
 "Bjorn Andersson" <andersson@kernel.org>,
 "Mathieu Poirier" <mathieu.poirier@linaro.org>,
 "Martyn Welch" <martyn.welch@collabora.com>,
 "Hari Nagalla" <hnagalla@ti.com>, "Jassi Brar" <jassisinghbrar@gmail.com>,
 "Nishanth Menon" <nm@ti.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Message-Id: <e6c84b91-20ce-474a-87f8-9faeb64f3724@app.fastmail.com>
In-Reply-To: <4d8a9786-ee4b-43b8-9207-e048c66349fe@ti.com>
References: <20241007132441.2732215-1-arnd@kernel.org>
 <4d8a9786-ee4b-43b8-9207-e048c66349fe@ti.com>
Subject: Re: [PATCH] mailbox, remoteproc: k3-m4+: fix compile testing
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Oct 14, 2024, at 14:56, Andrew Davis wrote:
> On 10/7/24 8:23 AM, Arnd Bergmann wrote:
>>   config TI_K3_M4_REMOTEPROC
>>   	tristate "TI K3 M4 remoteproc support"
>> -	depends on ARCH_OMAP2PLUS || ARCH_K3
>> -	select MAILBOX
>> -	select OMAP2PLUS_MBOX
>> +	depends on ARCH_K3 || COMPILE_TEST
>> +	depends on TI_SCI_PROTOCOL || (COMPILE_TEST && TI_SCI_PROTOCOL=n)
>
> This line is odd. IMHO "COMPILE_TEST" should only be added to ARCH_*
> dependencies, as often only one ARCH can be selected which prevents
> compile testing drivers with various multiple architecture deps in
> one compile test.

I generally agree, but the TI_SCI_PROTOCOL interface
definitions that were added in aa276781a64a ("firmware: Add basic
support for TI System Control Interface (TI-SCI) protocol")
appear to explicitly support the case of compile-testing.

See also 13678f3feb30 ("reset: ti-sci: honor TI_SCI_PROTOCOL
setting when not COMPILE_TEST").

> Normal dependencies, on the other hand, can simply be enabled if one
> wants to compile test its dependent drivers. In this case, TI_SCI_PROTOCOL
> cannot be enabled as it has a dependency up the chain that doesn't
> allow selecting when not on a TI platform. We can fix that as I posted
> here[0]. With that fix in, this line can be simply become:
>
> depends on TI_SCI_PROTOCOL

That's certainly fine with me, but if we do this, I would suggest
also removing the stub functions from
include/linux/soc/ti/ti_sci_protocol.h, and the dependency in the
reset driver.

Adding Nishanth Menon to Cc, to see if he has a preference.

     Arnd
