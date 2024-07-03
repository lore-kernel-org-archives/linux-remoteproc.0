Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3360288B1;
	Wed,  3 Jul 2024 09:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719997564; cv=none; b=s++ptLCz8/8QrQJY8+i7r/5EueSHeQBzuoLkFzA6dvTQ92X64sJhaNqSzhczX9SW+QpRk7TmYiRw9n4dJ/RmmU7nj5jIRsruwwYQzrRN2bn0p8G+YvfoBkedEywJz7AjYMmS/+wN4O77AboafRSMKtsrwtW6mE9W/pwD6V7sJ+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719997564; c=relaxed/simple;
	bh=lPh/ydh7sMpJmT5iWarBRwNNzOeXPc3ZWgbxoc64yy4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cb3T8HnOEvZtQccNtu4juI9NsZIOi1NMBiAhN6GwQMSJwQKmIKLnXwmchI1thQXuH7NVtDhFaK5jltoN4ewdgdylxbD0ZgpNiOgat1tyTplJwZ0z6AnFFThP/qR7BKPngbVDPQm5kTWNhMAaFNEquXf/qOQjQF4YvllvqR/MkRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Uj8pKfnt; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Uj8pKfnt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1719997561;
	bh=lPh/ydh7sMpJmT5iWarBRwNNzOeXPc3ZWgbxoc64yy4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Uj8pKfnt59TgBwEU6IsqbzOVLDIoTABNzPIwK3je9XYSaWOic5Qra9Vr14q1WFDbx
	 R4wRmaP01IBHUm7Kt7Zx8bIjWhNGdJfs/dDKThIZ1J2GTCzEPkxfQLeHB4snOhd3u0
	 lUuxcqDGt/ubpTA5vEAZjHUt/GbokyD1ljwfmbr2e5SWPV0MV8rUvnqAjj3/24Fsh0
	 Uxo/poQwvREdrU7xzRe09wzF14pZcj1Ek1Rlhs7cLyD96lSSQRiHTaFnNq0dSDW9zr
	 y/M8+CgsgOWgwfzBa+3tSbx34dxTNxW164gxnBkFy/Wzl5JeSv9U74OzI6gsxZMeu3
	 8kZPe/V/slruQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 8023C3782039;
	Wed,  3 Jul 2024 09:06:00 +0000 (UTC)
Message-ID: <f9cbd088-c00c-455f-912b-cc119566e62c@collabora.com>
Date: Wed, 3 Jul 2024 11:05:59 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: mediatek: Increase MT8188/MT8195 SCP core0
 DRAM size
To: Jason Chen <Jason-ch.Chen@mediatek.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240703034409.698-1-Jason-ch.Chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240703034409.698-1-Jason-ch.Chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 03/07/24 05:44, Jason Chen ha scritto:
> The current DRAM size is insufficient for the HEVC feature, which
> requires more memory for proper functionality. This change ensures the
> feature has the necessary resources.
> 
> Signed-off-by: Jason Chen <Jason-ch.Chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


