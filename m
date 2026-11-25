Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.56.87.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795647855;
	b=RFaMOE0LmK0jMfc2gXM3i+YZPnEtPDdgRWBZLE3Hg8HaCwgGVWVoagauLpOeTkoE7Lt3
	 qeZUqb+JuKX+sqY6oKGVlbHIAmjXp7xQdHMJMG/LlpieMmHjjWovBLS0HYNpHQR6cvA4M
	 XJxTLht3BKIYJC8hf8st0yVYn3SCFN0nnJY/Jquaua/w5h7Tp3RpDqQYsfB5Bg8VngsyQ
	 OXnVaecBdwXDlmDihE+Q8EA3h9cRMk+uxoVo+aX7ZmsFSMqSUgpgqAaD9sYM02lYpgD8E
	 R4cGzZcz5NdJ/xO8E3n1TyIShiAYzEh6a0efE8ZdOFXEbOYpiy296tXqXrgk43TpySw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795647855;
	h=DMARC-Filter:DKIM-Signature:Received:DKIM-Signature:Received:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-Source:X-Source-Args:X-Source-Dir:
	 X-SGantispam-id:X-AntiAbuse:AntiSpam-DLS:AntiSpam-DLSP:AntiSpam-DLSRS:
	 AntiSpam-TS:CFBL-Address:CFBL-Feedback-ID;
	bh=AMJchA9cehfGCW4JI5tP3dw+wnJqj4Q62yttfiUDjts=;
	b=m3RlQBTel+szAEeIuSwSUQcPClMcd+Yq1+FsxqxrQIDGvyuriS22ac0OAk8/mHof3oq8
	 38qVS6bZHzn72UFTxlQexeheqEwWHM6jZkqrOOXUP8l8I7bXik2lKin+TKAiGsKLXOnAJ
	 k+TgofSgF9jcK9YEIXtbnAeJz3gX83FZq4QmqBhzABmgnHfMk38Y1L//FKmcaCK2G4SZA
	 sPRp7MSjWs0osX4WNq3aetc0G6+ngUNFiWp1WY2QHGW9AlP4gHTSINtVrTMouN/6xQWBN
	 WVLvBSrEm9KNwjtINA0YvHBxJIRgecDgdYqJOeGBdPQmKhI8ur4I7licrVrWGPQlSQg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=valla.it;
	spf=pass smtp.mailfrom=valla.it;
	dkim=pass header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=1Nl9Wff+;
	dkim=pass header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=XMzbIqji;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.56.87.11
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5B7606A31E;
	Wed, 25 Nov 2026 23:04:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC5B7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=1Nl9Wff+;
	dkim=pass (1024-bit key, unprotected) header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=XMzbIqji
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-c9nw.prod.antispam.mailspamprotection.com; s=arckey; t=1795647854;
	 b=EHHJ0pZ+66xd2/KTwjaJWG7mQkaEB+eWzY8diWxYyCkvVbPBG/e0+H5U3US/7cQ6ge42b5Yg3y
	  glsnjB4hLxvnGl0q/yLADdum7KCspA36J+2Gr/CKahmk6RANQdqClaQrF2wb8mgknniE+XBxKj
	  gXJJqaYGuca07an4T9KRN5nWeCcFCznSTuWgsdnFdVF8Uo8b0Jwd7HHnGmfmRTfbpEak957XK8
	  0wNZdo3GuHx9AU6ZQQqQ9+2LBHsd6ePauIRk/wcRIjPmx2HfQBxSI7y3TwQ2ZNGoRc3QH48IoO
	  48LS0RjMPvAt2YrcwvkyiHC4tdW0wm8Pryqx2Mm7noKAmg==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-c9nw.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-c9nw.prod.antispam.mailspamprotection.com; s=arckey; t=1795647854;
	bh=+RIMyKG9kmMdd7WbaQwJFRdHDVSR7Qlcbw8pUb55dOQ=;
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:
	  From:Date:DKIM-Signature:DKIM-Signature;
	b=b2zHt0qu7skt/WqltGDYuJNn9ackhWsFEK/g7CSTT/oYlm/982+RX/TyxhdVTexDWY/3V2m/DI
	  XhR7j8H1v9v3Hc4BzSZyCoq0zFDp5Ogh4pPN/AQSbv1KWXn1DlD2zr13jboLup+H2Kr/JzZio+
	  391MrHTtGsNcZf2fheI7kly5FVQd4YluqXb9u0MRyIv+4sjtJ/rFAox0teRzba7gAX/1KwbF2i
	  iewF7KDP4L9SHSkmCJv+eXjHfpRVB2xnh3ppxROdcXGOXYV4LY8JvArwH9+kHfWhcY3CuFc8l1
	  rvG+KgfxSedHGxs/0wQfynNuiEXL/MXMa6g2jrnMtkqzEw==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	List-Unsubscribe:Content-Transfer-Encoding;
	bh=AMJchA9cehfGCW4JI5tP3dw+wnJqj4Q62yttfiUDjts=; b=1Nl9Wff+/fNQCB14hB/KId4ByZ
	rDzm6tMfLgcIL3kpDz8jw3kVKQnZ35b1w9NVKuXKkdea04qWSPy+CvJ0d/fWnkSf5/4sYBzVx5MhA
	lY5yJiBpN0wCj59k/rQo1DyhMtV+zECAOY7vlIgwU5Dt2UVHliPauFpDXKC0vijlYGmE=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-c9nw.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xWM22-00000003HZv-37Hj;
	Wed, 25 Nov 2026 23:04:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Subject:Cc:To:From:Date:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=AMJchA9cehfGCW4JI5tP3dw+wnJqj4Q62yttfiUDjts=; b=XMzbIqjiYMssI8t3r2yOAfgyoA
	Gdj10e7aEFF1CEgGrDK24njO4BK/G0czfFDH+E08+hBugbxXQXfQrzI9bB0S1KTRF/WB4nkYLZcro
	qccKMiW/uaY/Tn4lOHjvq2Wsd/eOTYgooTv4RUQ1oRsaCpjpjLWqnI8tf66SXrv5GRgU=;
Received: from [79.28.115.6] (port=61654 helo=bywater)
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xWM1y-000000007e2-0Ejv;
	Wed, 25 Nov 2026 23:04:02 +0000
Date: Thu, 26 Nov 2026 00:04:00 +0100
From: Francesco Valla <francesco@valla.it>
To: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: debugfs: use sysfs_streq() for write parsing
Message-ID: <awdov1J8T9W08fML@bywater>
References: <20261116184230.1885-1-saileshnandanavanam@gmail.com>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116184230.1885-1-saileshnandanavanam@gmail.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: fd2eae93dd0d2f2624514a3150680304
X-AntiAbuse: ID - fd2eae93dd0d2f2624514a3150680304
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xWM22-00000003HZv-37Hj-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-c9nw.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

On Tue, Nov 17, 2026 at 12:12:30AM +0530, Sailesh Nandanavanam wrote:
> The debugfs coredump and recovery write handlers compare input with
> strncmp() bounded by the write length, which accepts any prefix of a
> valid command (e.g. "e" matches "enabled"). The sysfs counterparts in
> remoteproc_sysfs.c already use sysfs_streq(), which requires an exact
> match and tolerates a single trailing newline.
> 
> Switch the debugfs handlers to sysfs_streq() for consistent parsing
> between the two interfaces, and explicitly NUL-terminate the copied
> buffer since sysfs_streq() expects a string. Tighten the length check
> to leave room for the terminator.
> 
> Truncated commands that were previously accepted by prefix match are
> now rejected with -EINVAL.
> 
> Signed-off-by: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
> ---
>  drivers/remoteproc/remoteproc_debugfs.c | 33 ++++++++++---------------
>  1 file changed, 13 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_debugfs.c b/drivers/remoteproc/remoteproc_debugfs.c
> index e8e7b6a3769b..ef6761a13c6c 100644
> --- a/drivers/remoteproc/remoteproc_debugfs.c
> +++ b/drivers/remoteproc/remoteproc_debugfs.c
> @@ -73,19 +73,16 @@ static ssize_t rproc_coredump_write(struct file *filp,
>  				    loff_t *ppos)
>  {
>  	struct rproc *rproc = filp->private_data;
> -	int ret, err = 0;
> +	int err = 0;
>  	char buf[20];
>  
> -	if (count < 1 || count > sizeof(buf))
> +	if (count < 1 || count >= sizeof(buf))
>  		return -EINVAL;
>  
> -	ret = copy_from_user(buf, user_buf, count);
> -	if (ret)
> +	if (copy_from_user(buf, user_buf, count))
>  		return -EFAULT;
>  
> -	/* remove end of line */
> -	if (buf[count - 1] == '\n')
> -		buf[count - 1] = '\0';
> +	buf[count] = '\0';
>  
>  	if (rproc->state == RPROC_CRASHED) {
>  		dev_err(&rproc->dev, "can't change coredump configuration\n");
> @@ -93,11 +90,11 @@ static ssize_t rproc_coredump_write(struct file *filp,
>  		goto out;
>  	}
>  
> -	if (!strncmp(buf, "disabled", count)) {
> +	if (sysfs_streq(buf, "disabled")) {
>  		rproc->dump_conf = RPROC_COREDUMP_DISABLED;
> -	} else if (!strncmp(buf, "enabled", count)) {
> +	} else if (sysfs_streq(buf, "enabled")) {
>  		rproc->dump_conf = RPROC_COREDUMP_ENABLED;
> -	} else if (!strncmp(buf, "inline", count)) {
> +	} else if (sysfs_streq(buf, "inline")) {
>  		rproc->dump_conf = RPROC_COREDUMP_INLINE;
>  	} else {
>  		dev_err(&rproc->dev, "Invalid coredump configuration\n");
> @@ -211,26 +208,22 @@ rproc_recovery_write(struct file *filp, const char __user *user_buf,
>  {
>  	struct rproc *rproc = filp->private_data;
>  	char buf[10];
> -	int ret;
>  
> -	if (count < 1 || count > sizeof(buf))
> +	if (count < 1 || count >= sizeof(buf))
>  		return -EINVAL;
>  
> -	ret = copy_from_user(buf, user_buf, count);
> -	if (ret)
> +	if (copy_from_user(buf, user_buf, count))
>  		return -EFAULT;
>  
> -	/* remove end of line */
> -	if (buf[count - 1] == '\n')
> -		buf[count - 1] = '\0';
> +	buf[count] = '\0';
>  
> -	if (!strncmp(buf, "enabled", count)) {
> +	if (sysfs_streq(buf, "enabled")) {
>  		/* change the flag and begin the recovery process if needed */
>  		rproc->recovery_disabled = false;
>  		rproc_trigger_recovery(rproc);
> -	} else if (!strncmp(buf, "disabled", count)) {
> +	} else if (sysfs_streq(buf, "disabled")) {
>  		rproc->recovery_disabled = true;
> -	} else if (!strncmp(buf, "recover", count)) {
> +	} else if (sysfs_streq(buf, "recover")) {
>  		/* begin the recovery process without changing the flag */
>  		rproc_trigger_recovery(rproc);
>  	} else {
> -- 
> 2.34.1
> 
>

Reviewed-by: Francesco Valla <francesco@valla.it>
Tested-by: Francesco Valla <francesco@valla.it>

Regards,
Francesco

