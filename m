Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52B0395ACB;
	Sat, 30 May 2026 10:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780137957; cv=none; b=aUh+Vy4KeeVwghp6sHtAFirCpkS6Ubvhrwkku2TWcxmAngCPrlrKmdaFxEExWQEgpyvGcUc123GgM3gUnYmTBIs7OiR5fTyCyMh3POc95DkoQYDqQZOkoX4nLbCle7Ry82mXxOpuGzW4kCUa//luTGEIbOvF50P6EqiYqw9mOao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780137957; c=relaxed/simple;
	bh=41mgkza2ssYfoIJMWXa24SoZZHPMX6psp/7XQSDOJ5o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ig12pXttmBZhmRgHSP5UDvndmtZ8/N/XdDYAhF597GbubZ7e/6+S7txQ+10+jesUp/9+956EQLRgu213E7lg+004Wd3n2HBevPZTyOwy007lb2D4U+hzCuD/J6G/tLDLV4EMG03qY1Qv5jti0D2OmTEV9UK0k42t54IuhiBGoUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LF9JPGAc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LF9JPGAc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02A011F00893;
	Sat, 30 May 2026 10:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780137956;
	bh=lgysvuYQa3VryADSMxaUOkvnpUJJME8Z4Jq9WXkJPsM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LF9JPGAcC6moprVYRK0U4dFljJn/TPozotuwfFii37DICafru5Y1mAAgjlhJ9e06z
	 9SGRJEk5thzrrSB5IJNQKd6brcTQ0i/vBmArRmWoFmnG8h6IuAGYaSBDGy2KeeHqb3
	 Sp41R1Po7GEY/ZeRbsnKV++sgd3pGQt9tUuRMhu7US3dBNO5r7CB5VyVRwJnr4Al8c
	 MHlCGcQFBcBuwg8mWJ4NFaTiaXJr19gtPbFlA5LTJRtrez5KvxKH6r01ogiKGgWFoG
	 FNu+9r/srmgiu5XJJG3+U9i22Hp84uOarJ1iY7Iyp6T02UirR9FKPBxgThJMe9BrRu
	 Xszkru5qtrvfw==
Date: Sat, 30 May 2026 12:45:54 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Peng Fan <peng.fan@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: remoteproc: imx_rproc: document
 optional "memory-region-names"
Message-ID: <20260530-indefinable-oriole-of-champagne-375a1e@quoll>
References: <20260522111849.783-1-laurentiumihalcea111@gmail.com>
 <20260522111849.783-2-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260522111849.783-2-laurentiumihalcea111@gmail.com>

On Fri, May 22, 2026 at 04:18:45AM -0700, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> Document the optional "memory-region-names" property.

Why?

Best regards,
Krzysztof

