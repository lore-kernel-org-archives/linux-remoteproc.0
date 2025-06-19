Received: from smtp.smtpout.orange.fr (smtp-71.smtpout.orange.fr [80.12.242.71])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899C617A30F;
	Thu, 19 Jun 2025 19:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750361350; cv=none; b=GKPB1du8fEYzw6Ry0v7rm4GjGZdQnDF34GAizYDz++Q9x/sypYE9AtCWRU324WPX27YSxudziSoOKO3BrCsBrY4pLEmd4roGFswm6Pal008rFK9zzxZtqirEidEswZsNHdB4VN+GFNDjp4M2Kh+5rih6C6ax/iIICix5NFm7WDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750361350; c=relaxed/simple;
	bh=oKYsIEPG/F2H84UChfpTayAFWAj1v/PKfPopIxoKvoM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=msxV9XAnRJ0M/059B7+RtB91EQx+VUWerpv6SmA0RSh4YPLkRi0XJvNpynKjZUNSIDi5pcm8sFdmqewA0F4d4Fo986kPOR+Q5Ftug6aGxNHJ4EzLmE/Nxhyj7MXqr2iogV7QjdfYEo/3vuOgFaJtG+w5p3L4IyuDK2Xo88XEIvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=HLEIdVQG; arc=none smtp.client-ip=80.12.242.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="HLEIdVQG"
Received: from [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
 ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id SKnRunekJCQ8aSKnSuMc8T; Thu, 19 Jun 2025 21:19:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1750360779;
	bh=tZGcukGSWJ9DLQSqx6SZ6egIb4DHuhct088IYf2fAyo=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=HLEIdVQGIi3iJtNlEFf3e5KuOsh9G10TnuIT/W6MQeWxWkBRIIRCBYmoAyLceN56z
	 +sWRwOZkrDe1DxYTSTxkNg+m29dzNpD7/4tJ95nEtAKCJLTAHXzUstmOWjuqA+CznM
	 bKSUdonQ97wweiFAqxJ0HpZYZOj1Jiw1FzXCTFaxAjQRYbSjQOqkQaBabKcmYiMPVH
	 OwSIuxFgyKV+ogUovpD+w8SSCsPuF1tXNCUHBRSzjMkJktL7/hLWA5iSF3H4f4nbSH
	 Uu9pC8V9n2em+U26CgZDrHwtNqCKjytGvZNTHA99PDaP5zpCd+i1DB3G+69kyvexLz
	 N0NXYbYu8QGGQ==
X-ME-Helo: [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Thu, 19 Jun 2025 21:19:39 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
Message-ID: <4138321d-6019-4bf7-a9a1-43340e1757ac@wanadoo.fr>
Date: Thu, 19 Jun 2025 21:19:37 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: debugfs: Replace scnprintf() with
 sysfs_emit()
To: Abhinav Ananthu <abhinav.ogl@gmail.com>, andersson@kernel.org,
 mathieu.poirier@linaro.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250619190410.5852-1-abhinav.ogl@gmail.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20250619190410.5852-1-abhinav.ogl@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 19/06/2025 à 21:04, Abhinav Ananthu a écrit :
> I apologize for the mistake in the signed-off email address in the previous patch.
> 
> Convert the debugfs show() functions in remoteproc_debugfs.c to use
> sysfs_emit() instead of scnprintf(). The sysfs_emit() helper is the
> preferred way to format sysfs output as it ensures the output is
> properly bounded to PAGE_SIZE and simplifies the code.
> 
> This patch addresses three instances of scnprintf() usage in the file.

I think that this patch is just wrong.

The 3 functions below are not related to debugfs show function.

sysfs_emit() expect the buffer to be pages aligned (See [1]).
In the cases below, the buffers that are used are defined on the stack 
just a few lines above.

It is really unlikely that this condition will be met.


CJ

[1]: https://elixir.bootlin.com/linux/v6.15.2/source/fs/sysfs/file.c#L767


> 
> Signed-off-by: Abhinav Ananthu <abhinav.ogl@gmail.com>
> ---
>   drivers/remoteproc/remoteproc_debugfs.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_debugfs.c b/drivers/remoteproc/remoteproc_debugfs.c
> index b86c1d09c70c..691fd523e0b5 100644
> --- a/drivers/remoteproc/remoteproc_debugfs.c
> +++ b/drivers/remoteproc/remoteproc_debugfs.c
> @@ -46,8 +46,9 @@ static ssize_t rproc_coredump_read(struct file *filp, char __user *userbuf,
>   	char buf[20];
>   	int len;
>   
> -	len = scnprintf(buf, sizeof(buf), "%s\n",
> -			rproc_coredump_str[rproc->dump_conf]);
> +	len = sysfs_emit(buf, "%s\n",
> +		rproc_coredump_str[rproc->dump_conf]);
> +
>   
>   	return simple_read_from_buffer(userbuf, count, ppos, buf, len);
>   }
> @@ -135,7 +136,7 @@ static ssize_t rproc_trace_read(struct file *filp, char __user *userbuf,
>   	va = rproc_da_to_va(data->rproc, trace->da, trace->len, NULL);
>   
>   	if (!va) {
> -		len = scnprintf(buf, sizeof(buf), "Trace %s not available\n",
> +		len = sysfs_emit(buf, "Trace %s not available\n",
>   				trace->name);
>   		va = buf;
>   	} else {
> @@ -160,7 +161,7 @@ static ssize_t rproc_name_read(struct file *filp, char __user *userbuf,
>   	char buf[100];
>   	int i;
>   
> -	i = scnprintf(buf, sizeof(buf), "%.98s\n", rproc->name);
> +	i = sysfs_emit(buf, "%.98s\n", rproc->name);
>   
>   	return simple_read_from_buffer(userbuf, count, ppos, buf, i);
>   }

