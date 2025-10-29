Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6361E5B70;
	Wed, 29 Oct 2025 11:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761735938; cv=none; b=XfShl0A24QI2ELx5x4f4p9atgjrd4wJPmg/l8hyqTmq6vg7Ztp98cKi7V0zqMe1goAZl+D6olxlrBT4Om8QVCs/K2HCOBO+HEXHIIC+JoxHlm4tHfTLscdwEv7n1bP4MfEJfBximjox5J3bRln5Kslqb91kRs160b4oyvCDcu2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761735938; c=relaxed/simple;
	bh=mUg1Il3vEFNsxJBIHBHWg1fUx+lCuD7mOLuml/XS/kA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YnbSPi/y1mEacbqn/MvKidc6Ll3dlE+M/lwVCqGZT8tEVxQ/kCSsT/srXjTNbOXjRVfdnF1CK+V34bM5ae0qQx0W9NMY0A+SzdodWAH75Rm3jbx5Sr52H5SraYU8ffa7AwotnHhrxsf4uXJXvMI4jCfKjLvpBsX4PSMd5JSUyoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=eRfHB5ns; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="eRfHB5ns"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761735934;
	bh=mUg1Il3vEFNsxJBIHBHWg1fUx+lCuD7mOLuml/XS/kA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eRfHB5nsrIx60bM6lSYTUZqKtS5Pa1OP6sGcYsJddJ0b05Uodu+JnvDDIS6sACk99
	 50QDCdU8GShKx6PB8udgn8h1R5GvWHl/Mda9iQ97OTt3saA0BRGWK4Zlv5DknpJNti
	 7DdaYDPP+5pJRotYCu9a03ChBbPmnENIsYaWfcDb+DzywBoKUYaG9YRtp/AnBPd3zG
	 XOAC6jemBWGFUMxkXcmuOZNYu1yLpMSWMGtTmyhvX2yQy3dcaGGFKtzX/QlZVs6iJ9
	 0pPhc7W1jsX/4H7ghLo8Wr1/+hB6RaMfTRjf0NR8n7CsExfF5IdhPYQ7yjkGp/aqc/
	 ftDzSawq8J3lQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C0BA117E00AC;
	Wed, 29 Oct 2025 12:05:33 +0100 (CET)
Message-ID: <9f5a3dc5-d0f8-4172-a4b4-867919612a2d@collabora.com>
Date: Wed, 29 Oct 2025 12:05:33 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] remoteproc: mtk_scp: Construct FW path if
 firmware-name not present
To: Chen-Yu Tsai <wenst@chromium.org>, mathieu.poirier@linaro.org
Cc: linux-remoteproc@vger.kernel.org, arnd@arndb.de, andersson@kernel.org,
 matthias.bgg@gmail.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20251015084103.10737-1-angelogioacchino.delregno@collabora.com>
 <CAGXv+5Gs5_j5L3+HT7K-XYwVG6S8ZGhHZkEcS0HpdkcjRQq2oQ@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAGXv+5Gs5_j5L3+HT7K-XYwVG6S8ZGhHZkEcS0HpdkcjRQq2oQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Il 29/10/25 10:14, Chen-Yu Tsai ha scritto:
> On Wed, Oct 15, 2025 at 4:41 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> After a reply on the mailing lists [1] it emerged that the DT
>> property "firmware-name" should not be relied on because of
>> possible issues with firmware versions.
>> For MediaTek SCP, there has never been any firmware version vs
>> driver version desync issue but, regardless, the firmwares are
>> always using the same name and they're always located in a path
>> with a specific pattern.
>>
>> Instead of unconditionally always relying on the firmware-name
>> devicetree property to get a path to the SCP FW file, drivers
>> should construct a name based on what firmware it knows and
>> what hardware it is running on.
>>
>> In order to do that, add a `scp_get_default_fw_path()` function
>> that constructs the path and filename based on two of the infos
>> that the driver can get:
>>   1. The compatible string with the highest priority (so, the
>>      first one at index 0); and
>>   2. The type of SCP HW - single-core or multi-core.
>>
>> This means that the default firmware path is generated as:
>>   - Single core SCP: mediatek/(soc_model)/scp.img
>>     for example:     mediatek/mt8183/scp.img;
>>
>>   - Multi core SCP:  mediatek/(soc_model)/scp_c(core_number).img
>>     for example:     mediatek/mt8188/scp_c0.img for Core 0, and
>>                      mediatek/mt8188/scp_c1.img for Core 1.
> 
> I know this patch has been applied, but this scheme doesn't actually
> follow what is already in the linux-firmware repository.
> 
> For all the supported platforms, the first core, even for multi core SCP,
> already have their firmware uploaded as just "scp.img". Multicore SCP
> is seen in MT8195 and MT8188.

The only one that is affected is MT8188, which needs a rename or a symlink in
linux-firmware.

MT8195 is not affected by this change, because the SCP is used as single-core,
hence this code will look for scp.img and not for scp_c0.img.

> 
> I guess I can send a followup patch?

The only followup patch that I deem to be necessary is one adding a symlink
or renaming for MT8188's SCP and nothing else.

Please remember that some of those SoCs (including MT8195) allow the SCP to be
configured as *either* single-core *or* dual-core - and usually firmwares for
single-core configurations are not compatible with dual-core ones, because of
the SRAM carveout/usage.

Cheers,
Angelo

> 
> 
> ChenYu



