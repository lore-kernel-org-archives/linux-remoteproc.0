Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A80615B99D;
	Wed, 23 Oct 2024 14:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729694620; cv=none; b=Du3KM5xg0iFDH4yEFaf24+X2/3XgXoPPBFk0uiS5U1YTNhf9gg2h0eRw9kSE/Z3eRx/zRymInrey1N+IJnZGlfQP8MxUes84MhneTr2ZPMZ0XTox2m8YV/CCDlNekLLCDADImCwDiD8mMbJHNxWyS+BAS1TfRcgXTqIhfLqTQC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729694620; c=relaxed/simple;
	bh=0q46oXK/enJ9KmaNkFKxLNRox8QQXImjEsKnUrmOidY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=BxROem3OhnhcOnvLrgekHVFxIk2HxuXkYXCUD0OQQbkcfXLcwb0RbbQolbG6JLwv/66e2iz7gSuu/ThX46sWGje+smOZlSYPmcyrwslI/AnIClLKO7j3t0+XvUtCN+DmC+jCXgzzt80A2DOTUp8lYyJfSO8n4FxI9HQCNCUYiAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=s9fWgiA3; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="s9fWgiA3"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 4162742B33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1729694618; bh=Si+mqdwQIHOA4eAyEaQvW2ZCeDiwuSydYETZ9zTnOeA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=s9fWgiA3a2q0iEnqcf+Mm5YOhamaKFfmTu5AKq/GvhZU/eRNpFBVIdZmhnb34csJI
	 snoAo+pt1ZC1tbwRoyesOY6X4UogmD5QylNTBkgXMF1jQsqDy5XKu+UsnT2Q3ZCkpY
	 lxSuKQN37cocKg5oJk41etd9kd4aJqBBmBNUGF7Zs0qhQN02LQCKoHgeYIH20gvoV3
	 NxXKXxvVIpk7qtrmEBwY6W74avbIGIIjcN9BnaLkZcafynpmxiYH07U/rr1O3d86/j
	 5THRrW1Dp5XDxJD8acaN7AQS0uzsKGXAw0DjC0N9auXJ7wgX/C/FQKgrnsbSRCgczg
	 qb08nztLct/QQ==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 4162742B33;
	Wed, 23 Oct 2024 14:43:38 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: anish kumar <yesanishhere@gmail.com>, ohad@wizery.com,
 bjorn.andersson@linaro.org, mathieu.poirier@linaro.org
Cc: linux-remoteproc@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 0/1] remoteproc documentation changes
In-Reply-To: <87a5evncxf.fsf@trenco.lwn.net>
References: <20241023053357.5261-1-yesanishhere@gmail.com>
 <87a5evncxf.fsf@trenco.lwn.net>
Date: Wed, 23 Oct 2024 08:43:37 -0600
Message-ID: <875xpiop5y.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Jonathan Corbet <corbet@lwn.net> writes:

> anish kumar <yesanishhere@gmail.com> writes:
>
>> This patch series transitions the documentation
>> for remoteproc from the staging directory to the
>> mainline kernel. It introduces both kernel and
>> user-space APIs, enhancing the overall documentation
>> quality.
>>
>> V4:
>> Fixed compilation errors and moved documentation to
>> driver-api directory.
>>
>> V3:
>> Seperated out the patches further to make the intention
>> clear for each patch.
>>
>> V2:
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202410161444.jOKMsoGS-lkp@intel.com/
>
> So I think you could make better use of kerneldoc comments for a number
> of your APIs and structures - a project for the future.  I can't judge
> the remoteproc aspects of this, but from a documentation mechanics point
> of view, this looks about ready to me.  In the absence of objections
> I'll apply it in the near future.

One other question, actually - what kernel version did you make these
patches against?  It looks like something rather old...?

Thanks,

jon
