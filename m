Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [81.169.146.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A5365C;
	Fri, 14 Jun 2024 06:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=81.169.146.216
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718346657; cv=pass; b=PdQ4WECKXHFDUQGGPFQhPWBYbVfM22gm6sd4q1Nsim8e/Z3kejJJwQbJeVAh9cdp7Nh3u5X5jCB7rBsueKSgWl+IyXUktllozbFTCp2fI85ckkreAEeVmsxbLX6PCNpijHPk9wjQnod4vh3wfljgikzjA7qGC77/YnG0AfwOplo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718346657; c=relaxed/simple;
	bh=O1Eriz3Qtnea33rJ/dxMlz2HR91ihJ5t6aL/t58H85c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YhvkZm8e9CXVeR1iO1DPSH0YO/EBE4tcR+3G3SacMOhaM1mKd+7fhwhlOVLVIDVV6i+59dZkFLUrAxN/ItGHjovD8w1SPUGfW8zhrzeYOzbofJeSk3izXWj0gtMXigrkAVBRIuIoCEwPiSpns4SknbGse93q/Sse8hVbmc8jBZU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ibv-augsburg.net; spf=none smtp.mailfrom=ibv-augsburg.net; dkim=pass (2048-bit key) header.d=ibv-augsburg.net header.i=@ibv-augsburg.net header.b=UNjOHm/x; dkim=permerror (0-bit key) header.d=ibv-augsburg.net header.i=@ibv-augsburg.net header.b=+CX2NAm5; arc=pass smtp.client-ip=81.169.146.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ibv-augsburg.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ibv-augsburg.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibv-augsburg.net header.i=@ibv-augsburg.net header.b="UNjOHm/x";
	dkim=permerror (0-bit key) header.d=ibv-augsburg.net header.i=@ibv-augsburg.net header.b="+CX2NAm5"
ARC-Seal: i=1; a=rsa-sha256; t=1718345570; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=aQJif1Z5sRzbVhT5HahI8CmeGQVKefPS+JjK1VOMHQSa4bv/+pyJm+8R1ik2xlhS4E
    wgOQ+iQlgHwtim+o4/fksibNd8ZAYXgx9IIzdjJS12QJyAoB4iGXX/GKf9yLjeE1zJxs
    UYCrJvOi0+p77iAPuu5WHQboaCw4nigoW1qxpulrbeQ1C+2yN6Q2+DZNjoODbbxyXpm/
    8XLYAvwH32ncQKe8pC+ykSWGblmJiITMGnOLOLZQp2V4o18tzsJL36rawfjLxBxLGzAf
    esINtaCsUoaM9L2RSiPVM/UZvCrM9e4iKTw48TX0JleiLimPUmlpMbn/ykrFAU10rev8
    CdcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1718345570;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=HJrnEa2TQHKLptvN9wCOfzygIXZCRpF3mXB1yR4PZcY=;
    b=SZizUCQ2I7u+U7y1T0vb8XOXwqRZiMIkbdbVlPTSnPgJU+lOvZuCNlefDgQyzQegjk
    YJeJd8wKpNmNx6cyV03jn/64zfqqFwrV38twVURP9rFTtVhuNml11jaSsY2OvKJuAV2l
    +159WdPTCEyzvbb8JclyJ1XdA64IFsjWodwEgI+Qx3luMjbhGu3swlFP0MSSoZcIMrRa
    YdxwreSsh3+gj6LFavubtanGuUrUoRzdCY5kvc+izYCDTN73xxzmY11scnCMyDiWmMv9
    jRFd4D82O3WuK6h9hID7Uo8bIMMTZLs7mdzx0LGRxr4e6uohlfyWonDlEy60c2AuE6D3
    W8lg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1718345570;
    s=strato-dkim-0002; d=ibv-augsburg.net;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=HJrnEa2TQHKLptvN9wCOfzygIXZCRpF3mXB1yR4PZcY=;
    b=UNjOHm/xyiy0PWuLbXHAOBfhgItkcsqcBwN+gc9WpS+nEQblC3Pg1rDPL1cZ0OxRlJ
    7seJ0CKIK89vBf1fRpM3yXJpcq1cdHvapWjPpg0EW+p24XsaFjoY5dso/Ghh8T6S2Vil
    AWTQ2YX216ZWxkHiYT2jlwSfFe8E3d+rmMykMrclRshc76TP5A2OcK9hfa01i/aUx285
    wQZuEm6GNBdQ3P9lK6i2iIGn+gdbWsBM+ft/sUW408+87iS78+MvVrG3VhCrcMyYBH6n
    jMUXDPjrX5yYreoLgZO58IppAcAqZifFlJaQqZTBRjTVNmBiRe8lxdUrlwJGcpGRw/tI
    rq0g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1718345570;
    s=strato-dkim-0003; d=ibv-augsburg.net;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=HJrnEa2TQHKLptvN9wCOfzygIXZCRpF3mXB1yR4PZcY=;
    b=+CX2NAm5lDQD2zJg7tvLRUjsX5d5Zpj2O/PcJDrL01sTCzOX6VqoOGwMBFLPkHI3Iu
    D2bMzZ9KUWVqE9fCn1AQ==
X-RZG-AUTH: ":KGMJfE6heLGk8b3w7Oa1fDtXwBjeDczIOHPRx8yNRKhFG/cxcP9JMCwOG/8exKYiOUajXIudlAcw8bfa"
Received: from [192.168.178.123]
    by smtp.strato.de (RZmta 50.5.0 DYNA|AUTH)
    with ESMTPSA id N07c8805E6CnVZi
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Fri, 14 Jun 2024 08:12:49 +0200 (CEST)
Message-ID: <6b45e79b-84a6-4935-adce-cc8b0d0dd7ea@ibv-augsburg.net>
Date: Fri, 14 Jun 2024 08:12:50 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/13] OMAP mailbox FIFO removal
To: Andrew Davis <afd@ti.com>, Jassi Brar <jassisinghbrar@gmail.com>,
 Hari Nagalla <hnagalla@ti.com>, Nick Saulnier <nsaulnier@ti.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240410135942.61667-1-afd@ti.com>
 <b5c8d134-edcb-4a1a-8940-b26047c9b79d@ibv-augsburg.net>
 <4d7c1525-a3d1-48f3-9e9c-eb61527a1b23@ti.com>
From: Dominic Rath <dominic.rath@ibv-augsburg.net>
In-Reply-To: <4d7c1525-a3d1-48f3-9e9c-eb61527a1b23@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13.06.2024 14:22, Andrew Davis wrote:
>> We looked into this some time ago, and noticed that the IRQ approach 
>> caused problems in the virtio/rpmsg code. I'd like to understand if 
>> your change was for the same reason, or something else we missed before.
>>
> 
> It is most likely the same reason. Seems despite its name, 
> rproc_vq_interrupt() cannot
> be called from an IRQ/atomic context. As the following backtrace shows, 
> that function
> calls down into functions which are not IRQ safe. So we needed to keep 
> it threaded:

Thanks for confirming. This is exactly what we've been seeing.

Regards,

Dominic
