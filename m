Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B1F285CB9;
	Thu, 30 Oct 2025 09:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761816804; cv=none; b=gbDFELK07M80SEXXG+d90SwWxgnulGxJOtU3IPbi6UV5Ql9oXf/18C+JO5gYUvJNd1vu8oGC1yXJbncDmNO9p7Q7tUVXWhAEYj8p86NJR6P5jEmOW4VgJs5aBFSQnapcZel6qhNgKKkBIVgYtIMTD8jsw2Ffbs8yKyTnlu6ifRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761816804; c=relaxed/simple;
	bh=Uc+POICSyiMTjtw+yN5lE8RaU+hJ/qKWJLG4Qepa7S8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ufvE8NLAjzmhwm+4Rl/Yv5xLb5Is/vAeIT37l3rPd7hThCmJJFfJP7Uqkmn2P03+xxZ/xx1HM/QVUCusoG7JO8C3LbD7i9O04RhuWeECnBoRJTBnWmOlFlxj5B4KVVQchsWQQXYl6Z7xnKymHvmkMJ0ImtLyhLGjI6N5FdqZPqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Ql/eyUw+; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Ql/eyUw+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761816801;
	bh=Uc+POICSyiMTjtw+yN5lE8RaU+hJ/qKWJLG4Qepa7S8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ql/eyUw+mIsDdWaDdmdHjzHNAT4lrz+S3uGNw5XcX85b+Yukux9+wLoDmEgy3qB0N
	 daz0MaG6I8Sdw2m1NPTnjfmT3AvsckngsJZ0I49h5P0nJNObQyk5YyeEjIxwERJ79R
	 mfCWPU0WgSK5ORtt7NT5WWlRbWIRIU6Y7u5C3Sp38YxAG9OaMmLquGVRL2HmTO0ob/
	 Qq8vjx71NA3dGfcj+KVvdUMwX+nx7NNvXOaMH2/Jpz385RQfpW4HvZakhL2j/lvSw9
	 Ab7v5xJZIOJ0Kqfp7l3970XP0I5A4TbO5c6gDLGQHsu0K6Ju/VnZuyIEga9hYQ82/9
	 ETvQEGGfrrkTg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8E68F17E0CF8;
	Thu, 30 Oct 2025 10:33:20 +0100 (CET)
Message-ID: <febb8bb9-ab4f-4bf1-a0af-84c5382c3419@collabora.com>
Date: Thu, 30 Oct 2025 10:33:20 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] remoteproc: mtk_scp: Construct FW path if
 firmware-name not present
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: mathieu.poirier@linaro.org, linux-remoteproc@vger.kernel.org,
 arnd@arndb.de, andersson@kernel.org, matthias.bgg@gmail.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com
References: <20251015084103.10737-1-angelogioacchino.delregno@collabora.com>
 <CAGXv+5Gs5_j5L3+HT7K-XYwVG6S8ZGhHZkEcS0HpdkcjRQq2oQ@mail.gmail.com>
 <9f5a3dc5-d0f8-4172-a4b4-867919612a2d@collabora.com>
 <CAGXv+5Ge-uZHKATOvqQF25DRTcHFJkopUk-JUXDtpEen=BwCiA@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAGXv+5Ge-uZHKATOvqQF25DRTcHFJkopUk-JUXDtpEen=BwCiA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Il 30/10/25 09:21, Chen-Yu Tsai ha scritto:
> On Wed, Oct 29, 2025 at 7:05 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Il 29/10/25 10:14, Chen-Yu Tsai ha scritto:
>>> On Wed, Oct 15, 2025 at 4:41 PM AngeloGioacchino Del Regno
>>> <angelogioacchino.delregno@collabora.com> wrote:
>>>>
>>>> After a reply on the mailing lists [1] it emerged that the DT
>>>> property "firmware-name" should not be relied on because of
>>>> possible issues with firmware versions.
>>>> For MediaTek SCP, there has never been any firmware version vs
>>>> driver version desync issue but, regardless, the firmwares are
>>>> always using the same name and they're always located in a path
>>>> with a specific pattern.
>>>>
>>>> Instead of unconditionally always relying on the firmware-name
>>>> devicetree property to get a path to the SCP FW file, drivers
>>>> should construct a name based on what firmware it knows and
>>>> what hardware it is running on.
>>>>
>>>> In order to do that, add a `scp_get_default_fw_path()` function
>>>> that constructs the path and filename based on two of the infos
>>>> that the driver can get:
>>>>    1. The compatible string with the highest priority (so, the
>>>>       first one at index 0); and
>>>>    2. The type of SCP HW - single-core or multi-core.
>>>>
>>>> This means that the default firmware path is generated as:
>>>>    - Single core SCP: mediatek/(soc_model)/scp.img
>>>>      for example:     mediatek/mt8183/scp.img;
>>>>
>>>>    - Multi core SCP:  mediatek/(soc_model)/scp_c(core_number).img
>>>>      for example:     mediatek/mt8188/scp_c0.img for Core 0, and
>>>>                       mediatek/mt8188/scp_c1.img for Core 1.
>>>
>>> I know this patch has been applied, but this scheme doesn't actually
>>> follow what is already in the linux-firmware repository.
>>>
>>> For all the supported platforms, the first core, even for multi core SCP,
>>> already have their firmware uploaded as just "scp.img". Multicore SCP
>>> is seen in MT8195 and MT8188.
>>
>> The only one that is affected is MT8188, which needs a rename or a symlink in
>> linux-firmware.
>>
>> MT8195 is not affected by this change, because the SCP is used as single-core,
>> hence this code will look for scp.img and not for scp_c0.img.
>>
>>>
>>> I guess I can send a followup patch?
>>
>> The only followup patch that I deem to be necessary is one adding a symlink
>> or renaming for MT8188's SCP and nothing else.
> 
> The firmware was uploaded in March of 2025, and is packaged in Debian
> Trixie, and was also backported to Bookworm. Either adding a symlink or
> renaming it won't trickle down to users for some time. So this seems
> like a possible ABI break, where the ABI is the file name.
> 
> Or maybe you don't consider it as such because SCP hasn't been enabled
> in the kernel in any release yet?
> 
>> Please remember that some of those SoCs (including MT8195) allow the SCP to be
>> configured as *either* single-core *or* dual-core - and usually firmwares for
>> single-core configurations are not compatible with dual-core ones, because of
>> the SRAM carveout/usage.
> 
> For MT8188, whether the current blob is dual core compatible needs to be
> checked. The blob upstreamed to linux-firmware was built locally by
> MediaTek engineers and is not what we ship with ChromeOS devices.

The current blob is dual core compatible.

We assisted MediaTek (Moudy) in choosing and validating the SCP firmware for
MT8188, and made sure that it uses only one core, and that doesn't clash with
the second core SRAM.

Cheers,
Angelo

> 
> 
> ChenYu


