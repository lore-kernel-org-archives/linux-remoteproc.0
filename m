Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9D31487EB;
	Fri, 28 Jun 2024 09:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719568407; cv=none; b=R+DSii4SEteIz53T9hN/z3J6J189fWUAToF9HHnusCjbc+1oj5KTNK+ISvCtx8eggvXp7ecZLu5cCAk9JR9kClubq+zlwP99hgYR398FDTT7hqCpq2xxbkY49IjvzEEdfDc3s7KlqEopaik+GeUbw4T7Uc9dzpnNLMYXaf3xcck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719568407; c=relaxed/simple;
	bh=GGp5avNm3U2GqffjO4bNSxJafft+tmU4w7edWSFEU2U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CuPLc1S4KJSokB2WzmyJf1S5YFGVeHetMg7ndoF1ytcovXJpddPLhj0RxKFduWH8C3xspKn/wXFj3T1TK7l1/LFNteDeGxLJLFMxPptP2i4O8SGo9uc5NqfZ34cF5z1rDmeFhS/pjGkNinWbbnzltpx4HwElSxC9CaMfEuWruk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=cM5awahq; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="cM5awahq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1719568404;
	bh=GGp5avNm3U2GqffjO4bNSxJafft+tmU4w7edWSFEU2U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cM5awahq6mIF+K13HJdN9XL1+2kZZsHAbkf18xus3VFXovKqZDYuK1IOYpFGSLkw9
	 SUA7K2F72QMaCTK2/8WBvgi4qEfUlnNcaYT9RonYy3PFCFJW7+d3VsK0wugton9uFa
	 Cgz5Xj+JIlHE2cR4J4TIIH72zvI31uhWE+G2bpjsXOW672PRn9wrKQKf36lF8KWkK7
	 trYTMPONqfUO0oOQ7sdgvtXY/UaYtSTolM/QD7rEISkDDclno68gNGCQLawTqNcGuj
	 fYlEgLBwCLDlfVuVYlIeJXPG1o96ebEHMpX++wbCq5faK+UW/EEL1lnc6kdPa9z/tU
	 Jw3/EsMJE3xwQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 15F853781115;
	Fri, 28 Jun 2024 09:53:24 +0000 (UTC)
Message-ID: <b50df7c0-1005-4e90-a518-6abee33e7539@collabora.com>
Date: Fri, 28 Jun 2024 11:53:23 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: mediatek: Don't attempt to remap l1tcm memory
 if missing
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Tzung-Bi Shih <tzungbi@kernel.org>
Cc: kernel@collabora.com, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240627-scp-invalid-resource-l1tcm-v1-1-7d221e6c495a@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240627-scp-invalid-resource-l1tcm-v1-1-7d221e6c495a@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Il 27/06/24 23:20, Nícolas F. R. A. Prado ha scritto:
> The current code doesn't check whether platform_get_resource_byname()
> succeeded to get the l1tcm memory, which is optional, before attempting
> to map it. This results in the following error message when it is
> missing:
> 
>    mtk-scp 10500000.scp: error -EINVAL: invalid resource (null)
> 
> Add a check so that the remapping is only attempted if the memory region
> exists. This also allows to simplify the logic handling failure to
> remap, since a failure then is always a failure.
> 
> Fixes: ca23ecfdbd44 ("remoteproc/mediatek: support L1TCM")
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


