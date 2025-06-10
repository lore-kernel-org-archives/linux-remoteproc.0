Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F7128C2C9
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Jun 2025 10:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749551910; cv=none; b=Oa8UuyenTQ8op+3B9h5IRNBGxBIAYADeAenodyX+cVfEPkGNCvsdfh7+QpDRsg5MOooXUFXBRKPjic8RkXXoyovh6zOA7w8+6E4by3l073cTpJz8dvJ7cHdZUiu7jMHPqgoOvtdGok6vYLdJ+jjQVwIHqw9Qu+x9wjPjLqo2+Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749551910; c=relaxed/simple;
	bh=AE+sUP3HEMMYaALXgLosS4awSefOKL9VYbo4VC+NJbU=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=ObbH/SW3jG6HQRFxKB+XZecssr3kzwOKlytwhAwKb/mkRk+6IQCg477xjoCsQKpir9xthYyeHyMfjoNH7OlIctpUMLkR/B4jVA9Ez/qPjkPD9sM4UvQ7z+4OLjR8yqeY9kkGQg7r9tCxyltRdBQnrXpAKUa36GSqBgejxcMy1K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=F/6y6aVY; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="F/6y6aVY"
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749551907;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YctFVp+NFks6JhouwOBSL22NHg6Z9MP2+A/tMRznPSo=;
	b=F/6y6aVYzP3MPOKzQCrKOU//mTJiCWa5KTWPzCHz9iltyCE11PQ6KXXG6YR+RFcA7TqHKx
	bftTeRy8ZDmSuyq0+QYu/URsrxxx1migbTNA4rU9xYxl9Ngfuc0n4GfwjdVNMc3HGMb86S
	gvUDidQrX30QxT4kdKoAERo7RJgwNPs=
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51.11.2\))
Subject: Re: [RESEND PATCH] rpmsg: Use strscpy() instead of strscpy_pad()
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
In-Reply-To: <CANLsYkxBxt-fE-kV3yS7WDQuF4o7OSL045fMmXrTvfx3P=A+1A@mail.gmail.com>
Date: Tue, 10 Jun 2025 12:38:14 +0200
Cc: Bjorn Andersson <andersson@kernel.org>,
 linux-arm-msm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <1F19F750-E9CF-4AC8-B14E-78C957869F75@linux.dev>
References: <20250429104543.66927-2-thorsten.blum@linux.dev>
 <CANLsYkxBxt-fE-kV3yS7WDQuF4o7OSL045fMmXrTvfx3P=A+1A@mail.gmail.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
X-Migadu-Flow: FLOW_OUT

Hi Mathieu,

On 30. Apr 2025, at 16:59, Mathieu Poirier wrote:
> On Tue, 29 Apr 2025 at 04:46, Thorsten Blum wrote:
>> 
>> kzalloc() already zero-initializes the destination buffer, making
>> strscpy() sufficient for safely copying the name. The additional NUL-
>> padding performed by strscpy_pad() is unnecessary.
>> 
>> The size parameter is optional, and strscpy() automatically determines
>> the size of the destination buffer using sizeof() when the argument is
>> omitted. RPMSG_NAME_SIZE is equal to sizeof(rpdev->id.name) and can be
>> removed - remove it.
>> 
>> No functional changes intended.
>> 
>> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
>> ---
>> drivers/rpmsg/qcom_glink_native.c | 2 +-
>> drivers/rpmsg/qcom_smd.c          | 2 +-
>> 2 files changed, 2 insertions(+), 2 deletions(-)
> 
> 
> I will let Bjorn take care of this one.

This one didn't make it into the last merge window, did it?

Could you or Bjorn take care of it or should I resend it?

Thanks,
Thorsten

