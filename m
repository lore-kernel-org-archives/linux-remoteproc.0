Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC655299954;
	Thu, 30 Oct 2025 09:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761816560; cv=none; b=Q/fR/263YbkRw7C02BDm2Ys1g1Y0RBT5gVILqY5MyLO8U3gwujxfCGcOTBrAkrSVQgRDjrmao2z7ogRxF68KSRf9VAOISo7mGb+bS56lmREhASkZXOeyE5O+awGJo9G2q1IQLRzFrq7CpQ0b7jxDM8a3H3HgC3GOGE2wQ5tXlqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761816560; c=relaxed/simple;
	bh=YyjGQwr4n5Ubu59xZkUEL74ae/TqjsZuDDm5YLuW3Q8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o9q5G56MCpB/ZLm/03L2hdvKz9b8/94ZMJqvkmWlxgAraIjr+3G+pHvCYtMR9+IOgNEP8KwMi4sXOPMZbxVC0g7h7zi1MXq7Bxihacq+wM51LcBDywpF1V3+jSTFIi/UdJLcR0I5WEncpl2AfjP6LMpJpdKoX1ki8hbJQOZpmbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=h+EBRGb1; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="h+EBRGb1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761816556;
	bh=YyjGQwr4n5Ubu59xZkUEL74ae/TqjsZuDDm5YLuW3Q8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=h+EBRGb1uH174RYx0/bt3F70i7EFNqYF93qQh2fbnEAFwy2dpGvFYenEKMS2c7UU1
	 ajeipmS2ovXFxr38PeuwYBCW3/8Y2ZAa5waMC+8HcTQUy6q1ThdCCuZairmfVDsPt3
	 JN7iwVBc2TQ6+gmcscpsp1jWpg7oOMPyv/bT7NIAtELUFab65OzsjNvwfsqjMAIGvx
	 7XDoageZ3llaz05qDybsO5Sn3wVTYn65Yx/EdCwv6Kua3IBb+mWyEIcCR+CIZE0/Z8
	 O5Ecwjxdm9yBpI7y0I+7X10LXc22Rlf8IMz+pMgc4HiOC2t0e07Ut1lmhwWE7EuTbo
	 ctLRWe8Ii8XDw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9203217E1380;
	Thu, 30 Oct 2025 10:29:16 +0100 (CET)
Message-ID: <141839e6-1dbe-4e98-8412-d47e853d997b@collabora.com>
Date: Thu, 30 Oct 2025 10:29:16 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] remoteproc: mtk_scp: Construct FW path if
 firmware-name not present
To: Arnd Bergmann <arnd@arndb.de>, Chen-Yu Tsai <wenst@chromium.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
 linux-remoteproc@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20251015084103.10737-1-angelogioacchino.delregno@collabora.com>
 <CAGXv+5Gs5_j5L3+HT7K-XYwVG6S8ZGhHZkEcS0HpdkcjRQq2oQ@mail.gmail.com>
 <9f5a3dc5-d0f8-4172-a4b4-867919612a2d@collabora.com>
 <CAGXv+5Ge-uZHKATOvqQF25DRTcHFJkopUk-JUXDtpEen=BwCiA@mail.gmail.com>
 <f434165f-1717-41ff-93e4-9be5b7fca929@app.fastmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <f434165f-1717-41ff-93e4-9be5b7fca929@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Il 30/10/25 10:10, Arnd Bergmann ha scritto:
> On Thu, Oct 30, 2025, at 09:21, Chen-Yu Tsai wrote:
>> On Wed, Oct 29, 2025 at 7:05 PM AngeloGioacchino Del Regno
>> <angelogioacchino.delregno@collabora.com> wrote:
>>>
>>>>
>>>> I guess I can send a followup patch?
>>>
>>> The only followup patch that I deem to be necessary is one adding a symlink
>>> or renaming for MT8188's SCP and nothing else.
>>
>> The firmware was uploaded in March of 2025, and is packaged in Debian
>> Trixie, and was also backported to Bookworm. Either adding a symlink or
>> renaming it won't trickle down to users for some time. So this seems
>> like a possible ABI break, where the ABI is the file name.
>>
>> Or maybe you don't consider it as such because SCP hasn't been enabled
>> in the kernel in any release yet?

Just as a clarification:

Exactly, SCP hasn't been enabled in the kernel in any release in the specific
case of MT8188, so this is not breaking anything, and it's not creating any
regression.

> 
> It's normally up to the kernel driver to know about the firmware
> file names and the order of trying the possible fallbacks, which
> is exactly why I originally asked to not rely on the property
> from dtb.
> 
> If you want a symlink in linux-firmware, that would go the other
> way, pointing the old filename to the new location.
> 
>      Arnd

Cheers!
Angelo
