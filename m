Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C2D2C190;
	Mon,  8 Jul 2024 07:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720424044; cv=none; b=OZ5WZS8Pn4Bi69Tnor9oZ2GNcjVgKKZWXgGI3gk9m1q6tnK9h5KHmZYGs1iJjvOW6jXU1JCFpT7TheDRdiUIf1CvBG3t/CZuENucQkkr4F3C/LigdA29qqEZb9pq6wpGIWbCqIAw0noC/3qSQi3LD9HXZZ9jcIwht86jnPIePSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720424044; c=relaxed/simple;
	bh=k+uHL+r1KGld/bCaf75K3N0eVgNccAN9YKGlrDKxtXA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y4LImH0qmHWIwNCCJQuw1SIc1g8a7bhhKuopdPHqvNIrrZqYrVu2shqSHBwU2IAgQP9XmIRdaarsHY29AOgXn5N8sjRj+BQAqx+EBI6H15xqpNOYzBkQvc5PLTUWNeLNg4qUbLsDekfFNDoNMsZzXVe7ljxsCnxDGkDEA3JkjAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=TQO53XEU; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="TQO53XEU"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7413820004;
	Mon,  8 Jul 2024 07:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720424040;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0pDbjWiqzlXoJwRK62KRTo8CbYzwvXFWm5jiu7miVts=;
	b=TQO53XEUkY9Y+4rv5ptpdY8K0txhr3258zN1DC/He7S/rffKeT3tAfbWcXmVy9GPXYvXbw
	mjieZonYhWNR5RUxQPTMhyT14O3LrqvCN/WulRO+2lr/8LeAkkMWxmoij9lqT9hdCgJnZg
	BHgB0CNW1aVk7vMs3QT/Toi4GQPdWOZVcDErr0o6D3p9OzX1ys9rLMpeUG13Qoc0H+1z55
	FYg9yq/msJW7OceVb2w/tW2bSiGeSuqR38I1nDZj2BwlJ/7ZCrekI9UjAhuumKC9+tICSH
	+HaGVXEQxKfxxk72lmKnxjCVsy7DPYcVSTrFrX+BlB8Pim5GzQm2t0KQp263bQ==
Message-ID: <3a208581-2fd4-4522-8cb5-c61fd52990c1@bootlin.com>
Date: Mon, 8 Jul 2024 09:33:58 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] remoteproc: k3-r5: Introduce suspend to ram support
To: Hari Nagalla <hnagalla@ti.com>, Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Suman Anna <s-anna@ti.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Udit Kumar <u-kumar1@ti.com>, Thomas Richard <thomas.richard@bootlin.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240621150058.319524-1-richard.genoud@bootlin.com>
 <9036f912-bc84-9179-5eb5-270fee6f8cb9@ti.com>
Content-Language: en-US, fr
From: Richard GENOUD <richard.genoud@bootlin.com>
Organization: Bootlin
In-Reply-To: <9036f912-bc84-9179-5eb5-270fee6f8cb9@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: richard.genoud@bootlin.com

Le 01/07/2024 à 11:59, Hari Nagalla a écrit :
> On 6/21/24 10:00, Richard Genoud wrote:
>> Richard Genoud (4):
>>    remoteproc: k3-r5: Fix IPC-only mode detection
>>    remoteproc: k3-r5: Introduce PM suspend/resume handlers
>>    remoteproc: k3-r5: k3_r5_rproc_stop: code reorder
>>    remoteproc: k3-r5: support for graceful stop of remote cores
> IMO, the patches are better reordered as below (since there is a LPM 
> rearch in progress)
> patch1 - Independent of other patches and is clearly a bug fix.
> patch3,4 - Support for graceful shutdown. A separate feature used by 
> customers wanting to change FW at runtime and is independent of 
> suspend/resume.
> patch 2 - suspend/resume handlers..
> 

Indeed, patches 2, 3, 4 still need some internal discussions.

But I think patch 1 could be taken as is, since it's a bug fix.

Regards,
Richard
