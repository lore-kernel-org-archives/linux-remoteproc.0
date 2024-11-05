Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6DB1D63C9;
	Tue,  5 Nov 2024 14:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730817041; cv=none; b=esx0Kv4Xauo/y4jX2BPD8SjUjRC1gwA4dkk5jQHi0crS9OkRwu5hXFfHqPRZb+oyFis2cbHYO/g9EKXEQ3ZnVO0twTCjArsKImkXiObvbGH6sLL72J5fm1WYCpJvPzeVD9Qged743y6sjUsZbJp92L5mKSch4Yw9bOgy5G34DQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730817041; c=relaxed/simple;
	bh=CBRfOK5MVuu1VOeCfFE21ByiY5axrelCzOMYMXG1WHQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Hr1qZNSouTqazy1yp6N6ihqUQ/bzNgOkgOYrBJ3AB7FQevOiluP7cacqQbmKShO32ILXJBX+g0fXtRPlF9mPjnm9lHBn5c5GWI2E3xjKn6n9x6AfkSc2huoV2Tm2qcGuXCcCLdQKZ+cgS7KT0tWoryhYIWeLIqh0d8OX8KPOiLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=cck1OR2O; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="cck1OR2O"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net C7AE942C0D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1730817039; bh=CBRfOK5MVuu1VOeCfFE21ByiY5axrelCzOMYMXG1WHQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=cck1OR2OepfgIySTEiT28NrTd3gazM/zlYi63Db0Xg1yq49nHWenxj2XjY5Rl4g6U
	 scg8CDx2jJ1qfUbHYAHABXc8/HIJUjkjwASISkuIzQ97BJ6DyoKL+xEsAm3LwxNyRs
	 CQQX5U6t3n0oz9mDGNVqamgcb1EIcNwdIkoAkmG/sxGro7znYnRJknVmsFLGxX6PZt
	 NAaelrtQmom6gkSbi5lDV1sWf8LeWEV0ju5GYFNSO5MvjQCx0A/SKtSbHpfECx3EpZ
	 LCNgA7g0aArHZQkHBO7a2JtTo5zZUVjiNFUcsr1TDOeMKrQgDdpmzSaCdb62d3ie0W
	 vFfGyA+Vdkv7w==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id C7AE942C0D;
	Tue,  5 Nov 2024 14:30:38 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mathieu Poirier <mathieu.poirier@linaro.org>, anish kumar
 <yesanishhere@gmail.com>
Cc: andersson@kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-remoteproc@vger.kernel.org, kernel test
 robot <lkp@intel.com>
Subject: Re: [PATCH 0/3] Documentation: remoteproc: update various sections
In-Reply-To: <CANLsYkxKteXHMvG3GfPOKz1G_NfQV8D0D4JxYeF0ZmiYv=Mviw@mail.gmail.com>
References: <20241105004749.83424-1-yesanishhere@gmail.com>
 <CANLsYkxKteXHMvG3GfPOKz1G_NfQV8D0D4JxYeF0ZmiYv=Mviw@mail.gmail.com>
Date: Tue, 05 Nov 2024 07:30:38 -0700
Message-ID: <875xp17nxt.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Mathieu Poirier <mathieu.poirier@linaro.org> writes:

> On Mon, 4 Nov 2024 at 17:47, anish kumar <yesanishhere@gmail.com> wrote:

>> Hopefully this time around, I have not messed up
>> patches. I have created three patches.
>
> And the patchset version?

Also, please include the cover-letter text with each posting.

jon
