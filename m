Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C58257449;
	Wed, 19 Mar 2025 09:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742376901; cv=none; b=jjuhDWSCfkQpB26xfw/q0yPQKYNNeekp5TphITxzu8TkSDqU7Ii7DdN0nskYZ2jbJgQvhGRQgguQ9uavT5V1uPnABYDwLjfrwmSpg+dv8xNjspr19PMKF+iq9dR44Qr1eUTHDU1ksWw3wREzHIChUrHgwuyHmo2Itxa8QdGvw8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742376901; c=relaxed/simple;
	bh=hlR1b92BGhraEdJ/3hiWtZX7ocppxEHtjil//YlkdMk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NhX2oPVQO/RO3EVrNh+qDcI9twNB5z/5B1sSQ4cXN4Vi/pSMwCoOCi+BIg0orUtELfFiu92y+hfmtPZn6+HwuFzYgGN26llbquTx1KaeQhZZyGdOYzUFryTs2EACS6RajB1EbBfdk0fqfUvpfI1osOeQR87JKepyUkoCDfzM+fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=AS2Iww3d; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="AS2Iww3d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742376898;
	bh=hlR1b92BGhraEdJ/3hiWtZX7ocppxEHtjil//YlkdMk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AS2Iww3d1F9jQhFkhUT9fyMjL5OAkGF/SF4kKJXETEPHnGmAHNAijXMxXXpZrhsBC
	 XTOQhExk8vXABOLCpVJZjcqnFnsce/WjhkwQyLmi0WxXPPneE9YXOgn0zKNjBUmrfq
	 NcM/lJpfpCZdpuXZtxd1xYitOoPghuTf0uZk6nXjHuIjQORpz+W57lkGQgwDbz1ju6
	 PJQ8XdfLseNd8JRtebwup/DJ+Wbb4mrINtF18oJ3iz99XLulSNfXbxoIo5V5flC4Px
	 CggIZG1vh9c1DTcEAUHNKh834OQqcCBFst6ZnQ8uzI04l2yHrx9c8FrEN3WWYKNjBq
	 3EavTVERywcBQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 539DA17E0673;
	Wed, 19 Mar 2025 10:34:57 +0100 (CET)
Message-ID: <5bbf7b0d-245b-4f1d-a712-1d81709e35d2@collabora.com>
Date: Wed, 19 Mar 2025 10:34:56 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: mediatek: mt8390-genio-common: Add
 firmware-name for scp0
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>,
 Olivia Wen <olivia.wen@mediatek.com>
Cc: kernel@collabora.com, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250318-scp-dual-core-mt8390-v1-0-8733e192cc73@collabora.com>
 <20250318-scp-dual-core-mt8390-v1-4-8733e192cc73@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250318-scp-dual-core-mt8390-v1-4-8733e192cc73@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Il 18/03/25 23:22, Nícolas F. R. A. Prado ha scritto:
> Add the firmware-name property for SCP core0 so the firmware can be
> loaded from its canonical location in the linux-firmware repository.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


