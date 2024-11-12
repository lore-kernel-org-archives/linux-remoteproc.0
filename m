Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2DA9219CAE;
	Tue, 12 Nov 2024 20:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731442184; cv=none; b=tgwv7X5G3QV2ESUSNnDdlo8YzgKD4CpalTyDg4mtMGtYJG9MwHZuJ1OlhaIRGSePE058pCfav4s8zrlRX3L5lEgfuFZJx5gE32Af0bqala1jvG07QVRYmI5F2nI99bP9QiDpTmXZCyoWCFhQC5r1l4iMBtp4ZpU60QEoDUY2MIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731442184; c=relaxed/simple;
	bh=2vCULAZGkeBIhGQxXoBIJVDg1hc3yitTRaatKQTZ54g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=X8qH0BMbTcHMemdKiVrTdhplWAvChTc9RGB7Tr7t+LzEsM/VGmUdLGuNzHHBMS6YS+LDcvjgiq9LfWPvsJzZVbwQMTaJ4+5HFT6ILKBLCrhg2JJOtJS2mCcWE16h5Q8u7jRhRPck+clyoS1V0kQEdxZH8PiXSAjXpCqhckIhxQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Zg/h0l0+; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Zg/h0l0+"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 3F32D403E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1731442180; bh=CYg/7JRAIkLHw/HmbbPoCTNR1SV4f0+sfiEh04PFSzQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Zg/h0l0+rbZDtPnEatsc0huC5yaEKrz4HMc6gbF/i1O0hfwyhz1GdfpUWrRHHA3gF
	 QeTieWOtZCrHpJraqNBVZ/unAxzX4Mp+uNOpHJsZaMCFxlAY/1Ih4wpmdj56YC6YHt
	 2Q6wTFHmPN2mQwibyKxZMNiR+38EL7MYxN2+btc8Jpswq4D9h+MCvNQLRvGPYcWUye
	 Uaw7dUJfMk79dB0ZFtnPBUtGnKlK5+hnAIGg538c5iE4Ukw83Q3UPcV4XepbHSvkIi
	 7FMOdtSafgb/GxQdKCO/pH4hBsxquFpW5RBVS+6XIbEYmUHUD7lsxg4Cqi/M4s9U6r
	 yWXXOiyOEKN0w==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 3F32D403E4;
	Tue, 12 Nov 2024 20:09:40 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: anish kumar <yesanishhere@gmail.com>, andersson@kernel.org,
 mathieu.poirier@linaro.org
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, anish kumar <yesanishhere@gmail.com>
Subject: Re: [RESEND PATCH V6 3/3] Documentation: remoteproc: add a note to
 rproc_add
In-Reply-To: <20241106051016.89113-4-yesanishhere@gmail.com>
References: <20241106051016.89113-1-yesanishhere@gmail.com>
 <20241106051016.89113-4-yesanishhere@gmail.com>
Date: Tue, 12 Nov 2024 13:09:39 -0700
Message-ID: <87msi4qkn0.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

anish kumar <yesanishhere@gmail.com> writes:

> Added a note to the rproc_add description regarding
> the availability of the resource-managed variant of the API.
>
> Signed-off-by: anish kumar <yesanishhere@gmail.com>
> ---
>  Documentation/staging/remoteproc.rst | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/Documentation/staging/remoteproc.rst b/Documentation/staging/remoteproc.rst
> index e0bf68ceade8..658ef7a28dd2 100644
> --- a/Documentation/staging/remoteproc.rst
> +++ b/Documentation/staging/remoteproc.rst
> @@ -223,6 +223,14 @@ If found, those virtio devices will be created and added, so as a result
>  of registering this remote processor, additional virtio drivers might get
>  probed.
>  
> +.. note::
> +
> +  there is a resource managed version of this api called devm_rproc_add.

Please always use the function() notation.  Also, starting the sentence
with a capital letter would be a nice touch.

Thanks,

jon
