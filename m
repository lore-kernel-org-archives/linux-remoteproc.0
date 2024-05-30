Received: from sender21-op-o11.zoho.eu (sender21-op-o11.zoho.eu [185.172.199.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03FE4D8CF
	for <linux-remoteproc@vger.kernel.org>; Thu, 30 May 2024 22:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.172.199.225
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717108839; cv=pass; b=CC0JHpqgqUol0hkg3yiBVDgAMMq08uEoE4GzkUrnyd+BiNGbqKV7gzMFlCBObqo/HYCwvR17FxAbMIkf7mBQdaYeRJT4j+lC2ppm8IO3hF0/emyeUozvYUkL9LCrCkhsdpSAOF9lChnAB/1GaIZTzJfCS32KmAfSCwjJUO3DGNE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717108839; c=relaxed/simple;
	bh=+GyyG9eSMyx7lzvqxYNeYPbo17yQoZT5qcASYjdHtAY=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=YhWt/gFiuN0v+ts+70TzTCE4sneYahoOGAevz9PH8FDAkVaoMEWr92tBqUhj/CGkRtLXX2Ky5adLJVmxWgxdnrCl7KPDqH0Uk7AcpyBU3pExbA2D2Yv0lsQ5PY5Jm/xJ9O7wNMcUJVm/fkW3OxEHZGr6ebIY+v/H5eo+mpkRyNs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=placeviolette.net; spf=pass smtp.mailfrom=placeviolette.net; dkim=pass (1024-bit key) header.d=placeviolette.net header.i=dev@placeviolette.net header.b=YIwc5F/P; arc=pass smtp.client-ip=185.172.199.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=placeviolette.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=placeviolette.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=placeviolette.net header.i=dev@placeviolette.net header.b="YIwc5F/P"
ARC-Seal: i=1; a=rsa-sha256; t=1717108792; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=hS9F3rbVAme1LpkfbhORfvRtfQHYO3fXt38IN31pf2WBpbWh46kOXF6iZ51i41rKtv5+kJvZc3oDHYYQzycLdOIu3/xPD2pSR4jvO+m2/m2s5gWgWp0xtrQAxZIcq6thWbvg+VzOBurLldAdyod+Iiie4aXWSxPuiVYDcrcQvMk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1717108792; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=mDStETwQo/9R9lk52eoeFLqdRJv18IPwNR5FM5Leuqw=; 
	b=kSH8DheaJ5PBj/37RT569i7xZOPaKe03hDeAK6lzae620O/9G56qkgV/Qph867BTi2CG8C68LrJtXDEkd8wtwR8dl8czadGT8iG3a0hkn2XOXiyLPiexPbBfRlRbW6j4E1p3I0346XmCNxrDAGkd6W1IhqbpaKvnsAR4j3VwiE4=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=placeviolette.net;
	spf=pass  smtp.mailfrom=dev@placeviolette.net;
	dmarc=pass header.from=<dev@placeviolette.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1717108792;
	s=zmail; d=placeviolette.net; i=dev@placeviolette.net;
	h=Message-ID:Date:Date:MIME-Version:To:To:Cc:Cc:References:Subject:Subject:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=mDStETwQo/9R9lk52eoeFLqdRJv18IPwNR5FM5Leuqw=;
	b=YIwc5F/PWW+4gTLrgSkmGcAQD1QptBy+0XPIP2H+6KmgyfERzCgNk0aJU8jhf2JH
	M3JFhfJzTTruhO72Ag/eA2wvp96Q+jj81Gc52YV0zsK5FUKRFB1PlzUMhKvrSXY4JZc
	sYC18NR3/USCnI3Nh4P4UBqpGI3/EUuiTi1gaVhw=
Received: by mx.zoho.eu with SMTPS id 1717108790902816.4816233199875;
	Fri, 31 May 2024 00:39:50 +0200 (CEST)
Message-ID: <00a76167-6d25-4c5a-b5a5-e61104b74147@placeviolette.net>
Date: Thu, 30 May 2024 18:39:47 -0400
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: dmitry.baryshkov@linaro.org
Cc: alexeymin@postmarketos.org, andersson@kernel.org,
 bryan.odonoghue@linaro.org, johan+linaro@kernel.org,
 konrad.dybcio@linaro.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 mathieu.poirier@linaro.org, neil.armstrong@linaro.org,
 quic_sibis@quicinc.com, steev@kali.org, wuxilin123@gmail.com
References: <20240512-qcom-pd-mapper-v8-0-5ecbb276fcc0@linaro.org>
Subject: Re: [PATCH v8 0/5] soc: qcom: add in-kernel pd-mapper implementation
Content-Language: en-US
From: classabbyamp <dev@placeviolette.net>
In-Reply-To: <20240512-qcom-pd-mapper-v8-0-5ecbb276fcc0@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

I've tested this applied on top of kernel 6.8.11 on an X13s over the 
past week and it's been working well.

-- 
classabbyamp
