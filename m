Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7181C2DD5E2;
	Wed, 24 Sep 2025 10:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758708771; cv=none; b=u9P4dJpIBsA8uKcQFLLGBF5Eyjwurg1A6yoZSydgvkag84JfoNAuUTKUwKagZpxYnOnsJ2X4nC21ZfrnwhSexvN1dVU2qUhujb9eqFKe1zCZNxJgwNuE2WU4u9QV6+AMTBE+sd+77yRgptyPKMeFtFsQpjbqFzNo8Xtw/5YVRxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758708771; c=relaxed/simple;
	bh=D5SpqLgtg8TrRXmvvRrz2Dlx97l0sLSkeQdtgoGX5SI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Na7D0Gvxf6S+4sCOrVneHZu0a35hLQxgDDzZR7dEyeNK5BDd043drH+KvY4r7JTH/+dpGe0l+19mKzvNgoQrAWchxK06Yn9zW3wQIAqFuoyH3n4JPBktqp8iJNdDIi52Tv/kB1A0bS3RlZ3x+9fdJmreszzihA+uc+kAAqitNEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=VMRVlyzU; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="VMRVlyzU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1758708757;
	bh=D5SpqLgtg8TrRXmvvRrz2Dlx97l0sLSkeQdtgoGX5SI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VMRVlyzUSQQ6kE9AdX4G3M8k1NdpJI3ti4OtMIMbU5YjZTZRFVE3fK3u9dYAJsWKm
	 KTDi3BHax89UW6IWma1FtBPrvF1JfBjAk5ppvRXsqsK9Srd+rPB8g5AhKFpgVFE4hh
	 Va1pk326vbWltn7cQG1WfchiRGBNZNSii0YRlp/xJ6sF5SLPAaAwHQEH8OmiqnKpGp
	 My5v2lbNgBhZIpGAxnjE9cBy6nwjFvkZo7VANX22HaOfvONB3TPUQqeFVK+CCL6xPK
	 QE+bsP4EReA0eLin783kd3yTi9GbfYORJ3zNeutH6qWSPZEr8czkMZs6NjXe/h8GxG
	 GP/DeF1tVKs9w==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 40F0E17E12A7;
	Wed, 24 Sep 2025 12:12:37 +0200 (CEST)
Message-ID: <30a75332-a7f9-41ed-a4e8-520b1e7c9bfe@collabora.com>
Date: Wed, 24 Sep 2025 12:12:36 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] remoteproc: mediatek: Support MT8189 SCP
To: Huayu Zong <huayu.zong@mediatek.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20250924084422.4604-1-huayu.zong@mediatek.com>
 <20250924084422.4604-3-huayu.zong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250924084422.4604-3-huayu.zong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 24/09/25 10:44, Huayu Zong ha scritto:
> Add SCP support for mt8189.
> 

Please split this in at least two commits, with the last one adding only the
MT8189 platform data and compatible.

Also, please clearly describe the new scp_secure_domain_reg write, as the current
comment is not clear at all.

Anyway - the code looks good overall.

Cheers,
Angelo

> Signed-off-by: Huayu Zong <huayu.zong@mediatek.com>
