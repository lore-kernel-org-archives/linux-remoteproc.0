Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [81.169.146.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15EFD1A269;
	Thu, 13 Jun 2024 08:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=81.169.146.216
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718265677; cv=pass; b=hBGgzP6GJvVWNXSyq0SnAaBT8ckmFjyVhNxKpJf4vVpURCuEbOBnqaKBoU7vJKiYTIPUM+k/n8FWQLOFjqc8TS5jDTV4b6p+sAfpEazFx2F0O1+17/iElQAo571vUq0c4sth3VxhL/mGSPtA5tGUtBJFar5IOGQ/iK5WvdzvSJE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718265677; c=relaxed/simple;
	bh=pS21HVE8uRgbz2fiL1iz3vnqzW4M7I1SyMqA7FKr+50=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=CPNOR/Utqq89Uy3rVUgGMoLtLL7JkTYU9UfBtNqbsd1Heg0hwHoVcw5fjJtz15h5Ln0ZkV7Sai5bhxbgfixXd3t8Ox1Z67y6HH2djae4d256M8c0uqxXVpLG9hnvOReCwTlvbEy8D4bo7WjS/u0l8XXJJcNX6fddrG1KM83FDwQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ibv-augsburg.net; spf=none smtp.mailfrom=ibv-augsburg.net; dkim=pass (2048-bit key) header.d=ibv-augsburg.net header.i=@ibv-augsburg.net header.b=nER13Ggg; dkim=permerror (0-bit key) header.d=ibv-augsburg.net header.i=@ibv-augsburg.net header.b=DmiwSiwH; arc=pass smtp.client-ip=81.169.146.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ibv-augsburg.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ibv-augsburg.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibv-augsburg.net header.i=@ibv-augsburg.net header.b="nER13Ggg";
	dkim=permerror (0-bit key) header.d=ibv-augsburg.net header.i=@ibv-augsburg.net header.b="DmiwSiwH"
ARC-Seal: i=1; a=rsa-sha256; t=1718265492; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=JuQpNCBFJrD3Aa1UaaCb5zDCqvIJfwYNONKFHn3sGPLYkUUj7S1DuT7V8E9T3l7YcX
    yaogSkCE45C704I0+maDuVO1Ynnmz5TxilBq6km84qkwehtUqB4HRtZd+Z+5x4Cf0Znr
    z15aHzyO2lS8XrNYv4nnifil1C2CFdGI1W19KQ5cwOu6uBd2e/ZoZVa49WsFU5nuDu0V
    WoNgOdmpD6ZOOPeqmDpnmVZaEBm51kmAgmWJx28OuaNgSWwVHXmcLZqvfxJ4nXdIQmfE
    oUZ90dgWi46f5m/ubjxTY2wj7B6Ht8wfbPSKGcILZ7dBXAMvCVaVPmF0E5SK/iEXoNDy
    BnFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1718265492;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:References:Cc:To:Subject:From:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=ZCOowjRMhthPrCgg0fyGh+uTy362GzG0djWS2ceHoqk=;
    b=R/kv79GQwqi0uf2JmZISAPcTvKH/3bNzHCX0v3BBOdgoSmg7ZZDlSxPd6r/NfePgC7
    ZtEqQLlYvBizDCRlluXekwTFLWpLrEGlewfNwY9LjT8VNYPhgBuvQWjKJLHJRpOyUVdQ
    g04dtwMY/IfjvWIZKjAGNcgSIq7WIa8hHy2EsRca3x+VeRdUJkbY/4l10nKUFuOiQG8d
    xi5mWvEIQTFaQvtIYs+oR5uQkEOcytNhNew9AX0hg6k+B6AD1atWpnNuqBYyZQbASwRM
    4dxTy3Y/+bPuMMdznpcmkwIfInj6+SQ1N1SrwHU1iKmbd+BmnIvbXHW0S/C0ZqdYnHbO
    QzJA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1718265492;
    s=strato-dkim-0002; d=ibv-augsburg.net;
    h=In-Reply-To:References:Cc:To:Subject:From:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=ZCOowjRMhthPrCgg0fyGh+uTy362GzG0djWS2ceHoqk=;
    b=nER13GggdZaz5ClPPzz9G4RHwfXH8VmdHajZSYQMhCnQttz2Q261EPzRBsEtUO6YmD
    LOncFIPsdw6aQPDuljFgN+Ng+Gl/J7ywbzBXQFdqzX9xu2Uu8G1MpuIqBHQbq4AfzNUe
    2omEST+P/qIx8rc/+O8I59bjr+R+XHJ8IjAwbhs6A5pIkq0f1/XMGHVN7pktw8DZKO0w
    GuAgDTBXVJQdvw+erNccMd0dt59BCpg2hzjf6xtFXLDlHDtrvfHPx8+z4bSl4iIFrLqC
    Ub1YEwDw4j401NEJ6a6g9XWmzg6ThfaN1J2RuCwmZOT4cS2Q/z5RcvCq+oW6WngMC/Mt
    kl8w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1718265492;
    s=strato-dkim-0003; d=ibv-augsburg.net;
    h=In-Reply-To:References:Cc:To:Subject:From:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=ZCOowjRMhthPrCgg0fyGh+uTy362GzG0djWS2ceHoqk=;
    b=DmiwSiwHKsWy6QI6p/UhcxPsn/DabjiO0Aor5gjual9pUYT5CdB04dglnXJL89jImj
    JKG8j9OOWyNT0rK4YzBg==
X-RZG-AUTH: ":KGMJfE6heLGk8b3w7Oa1fDtXwBjeDczIOHPRx8yNRKhFG/cxcP9aLpSo32t1tpzL2/4JjVjHoSYrKRModkCm"
Received: from [192.168.178.123]
    by smtp.strato.de (RZmta 50.5.0 DYNA|AUTH)
    with ESMTPSA id N07c8805D7wBRIf
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Thu, 13 Jun 2024 09:58:11 +0200 (CEST)
Message-ID: <b5c8d134-edcb-4a1a-8940-b26047c9b79d@ibv-augsburg.net>
Date: Thu, 13 Jun 2024 09:58:07 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Dominic Rath <dominic.rath@ibv-augsburg.net>
Subject: Re: [PATCH v2 00/13] OMAP mailbox FIFO removal
To: Andrew Davis <afd@ti.com>, Jassi Brar <jassisinghbrar@gmail.com>,
 Hari Nagalla <hnagalla@ti.com>, Nick Saulnier <nsaulnier@ti.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240410135942.61667-1-afd@ti.com>
In-Reply-To: <20240410135942.61667-1-afd@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Andrew,

On 10.04.2024 15:59, Andrew Davis wrote:
> Changes for v2:
>   - Use threaded irq as suggested by Hari and to
>       fix possible "scheduling while atomic" issue

sorry for beeing late, I noticed this already got merged.

I was wondering what the reason was for ending up with the
threaded irq.

In your v1 thread your final conclusion appeared to be

> So for now I just kept this using the regular IRQ context as before.

We looked into this some time ago, and noticed that the IRQ approach 
caused problems in the virtio/rpmsg code. I'd like to understand if your 
change was for the same reason, or something else we missed before.

Regards,

Dominic
