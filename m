Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186FB2EEE90;
	Tue, 22 Sep 2026 11:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790077507; cv=none; b=cmUuhVOd606KvbQygXJJCmx1/W/V34N0DCX9k9T51HxNSTPm450LLT1zUrTll7FP2zjUEJFRYHiBxDrMF/PNNZCRWZAgl8jBQKCito5hCKRED/bSyBqlmRgvKLg2bBMNqsO+4s3gK7Auc8tIxnXPI9kIcfmtfFx5qYgBqQJzg7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790077507; c=relaxed/simple;
	bh=V3w3+8xXZ1Zb5lNKOebjguliwDwnSOWbcB2XO4qW0eI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YVpZIiNhwB8p/p7ei5443uZTRzQGK9Dp0JNACFSE7TKyfMZxVkhvI/y9LowvRpsiKTRZzQLEq6s6lbg1OLVlA0M2Z92RLznfzcF9BLIec2l+lLkjqRkVHmYYjbOM2eTXtUoo69B/UobLZWdAEl6A0TrLuW85thRFklKtZRvJ9iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=MMdVKQMK; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="MMdVKQMK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790077504;
	bh=V3w3+8xXZ1Zb5lNKOebjguliwDwnSOWbcB2XO4qW0eI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MMdVKQMK6le7LIAa3HshD4GMWPejT+FRMh+dZ0zBVRFX0atXjll/DsBVm57t9xTH2
	 pmmbwqC/3zhTVafw97StE6baPzF9F68WJP4u9AdbZtFCQ80MEiykWRVI7Bas5rxcSc
	 TGuPSzD4Q6gvZ9kAT/Dgfco1RKS5sDi9ddG9uQBFajN1Ya6mX5PhEnYqpcZdu4Qx4Q
	 KvHqFwx/QBhZwTSWshJ0vhttboZKq+I4//xhkgRjSsxMOdyz0zDw0mBNAab3Nxgqw4
	 ts057oZ1MEfsjSaQQHZoYihTq06nklIg+UIzRynlhdvMty68tVmtt561lJ3WkgpdNV
	 idQcjvtK6foHw==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EE99917E06DB;
	Tue, 22 Sep 2026 13:45:03 +0200 (CEST)
Message-ID: <0982de65-9764-439e-bb4f-64034868aeb8@collabora.com>
Date: Tue, 22 Sep 2026 13:45:03 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: remoteproc: Fix MT8188 SCP regs
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20260921232520.3127457-1-robh@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260921232520.3127457-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/22/26 01:25, Rob Herring (Arm) wrote:
> Allow single-register MT8188 SCP dual nodes with only the cfg
> region. Keep two-register and three-register requirements for the
> other MediaTek SCP variants that need SRAM and L1TCM regions.
> 
> Assisted-by: LLM
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

