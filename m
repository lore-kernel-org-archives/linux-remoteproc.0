Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.61.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470693BCD33;
	Fri, 21 Aug 2026 08:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.61.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787302127; cv=none; b=Yll9w5EPioie9c7FIKtZ9rvfVNfiu4UJIdKA9oPMnSgrLUC41hR4J6qtn5gYsmO/0ZLXWYGEjOPLhtOGapSZmVB5X+SDPthLQ5RW8okJCxb4AWVaM+dZ7X+QyKyvZ2Qc9KyarB2YL1VMWH10l2SnM1ETwv9XXMjSXYwOwJVgBj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787302127; c=relaxed/simple;
	bh=5ybZ6jSqfyHidqXWXRWzPuYG8sB+wVG/yMIK7GQJvtQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=npNM7NehyrdTqw0J9TNQamYTN2A4r1dC/VGSHwmIMuvqwAMm9LZQgyC5K0vk79dF5ueeYkmQirpjpogdYXPNvn3eQgEJO4t+eNtkuQs+G8jzJA+h4rCQdJLTUmHtbitucoH3F+ZiBguTRmB53LOaZNmnXEDWUr3WNeMbsm326yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=WdkfniAj; arc=none smtp.client-ip=188.68.61.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="WdkfniAj"
Received: from mors-relay-8403.netcup.net (localhost [127.0.0.1])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4hRDGz16QBz84Sr;
	Fri, 21 Aug 2026 10:38:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1787301515;
	bh=5ybZ6jSqfyHidqXWXRWzPuYG8sB+wVG/yMIK7GQJvtQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WdkfniAjkD0jJeNM/ej8CrQZXO8m+zW04+Jm+0k6J75NJuzkTkJTYS+6bsnz9CHdm
	 vAJW5m/1ZmMFQq1bxXlmx4CKq9z4Yc5gqLEd54KNWdbSZhcaWixeVX9E1mLlvKS6og
	 3QqqQJyl6m0Hn7g9OQq9sQdtIqIz/JVC7SyQ3gj8peC0k0R9+BdHGrBwRyWy56Ux/A
	 ngoeLMUVrIQCbY0SX+DxKTMzHmuwYDECL/Uzu52VuuqXtacn0wcIAOYlT3EET06sxJ
	 W1ByiDZWoilptZTtsX/ErHxnhYAFFpii7V+62B95dNlJJaWRfG4ohh4M4AJadlKkw+
	 pm0yVGjf2kjSQ==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4hRDFr5X8Tz84fN;
	Fri, 21 Aug 2026 10:37:36 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.901
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4hRDFm4nRcz8t3w;
	Fri, 21 Aug 2026 10:37:32 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 8DA045FA31;
	Fri, 21 Aug 2026 10:37:31 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <6638b89c-b0af-43d0-8d4b-96ed0e803962@leemhuis.info>
Date: Fri, 21 Aug 2026 10:37:30 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] qcom PAS TZ API migration breaks GPU and modem on
 TrustZone without PAS (sc7180 trogdor)
To: Paul Hollinsky <phollinsky@holtechnik.com>,
 Konrad Dybcio <konradybcio@gmail.com>
Cc: Sumit Garg <sumit.garg@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
 cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev
References: <943d1db3-f117-4e9c-94db-7221b47d9d29@leemhuis.info>
 <20260821082730.89413-1-phollinsky@holtechnik.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <20260821082730.89413-1-phollinsky@holtechnik.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <178730145227.2547326.9353540420644801552@mxe9fb.netcup.net>
X-NC-CID: fndcPxiVxwzlH0u76SHpIo/ezksonaczEIibpTdcNK+di70THPY=

On 8/21/26 10:27, Paul Hollinsky wrote:
> On 8/21/26 08:33, Thorsten Leemhuis wrote:
>> Just wondering: who will submit the proper fix to ideally fix this
>> before the culprit hits mainline
> 
> I have now. I sent them as two separate patches, because the two culprits
> are in different places:

Great, many many thx!

Ciao, Thorsten

P.S.:

> #regzbot monitor: https://lore.kernel.org/r/20260821081325.89088-1-phollinsky@holtechnik.com
> #regzbot monitor: https://lore.kernel.org/r/20260821081540.89137-1-phollinsky@holtechnik.com
Thx for that, but FWIW, there is no need for that when it comes to
regzbot: the link tags in those patches would have taken care of that
already automatically.
