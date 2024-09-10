Received: from smtp.smtpout.orange.fr (smtp-19.smtpout.orange.fr [80.12.242.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211A41A01CC;
	Tue, 10 Sep 2024 17:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725987917; cv=none; b=tlKmh8qOM4cKAuCRqBi5ZQ7XiqXGOOJreWBdLwfvQEyxh4wYewrtgM54Xpv/9faJCtjjUAYBxRLw/65+/ocrVarXUtFFILg9haiE1lR5BdM05RHP6UrEfLXSh1E5fVcku29yBOKCSJarx294Jnxib+Uh3hBVU2oo+4m1XQCUrjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725987917; c=relaxed/simple;
	bh=x2vpo566IpKINGvRxE112gh8KoGHeHf3zP1Nk6w3PW8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uj8IFjQopmrrYfihWqjmYoNtZQlaSTSBdoSWL6NCi3ehYUIPCKajWUbOeaaIBp5YXw16VRfal2/WPaY8n0sD72iOcRgNrKCYNhXtDHJeNLZM/Ra7Bmd5nw8drF1fFvQhpUoZObaH+u35zwGC6REgl8bHMIejHCdvkHEP7+lpOto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=s+FYJdZo; arc=none smtp.client-ip=80.12.242.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="s+FYJdZo"
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id o49vszwl60aTdo49vs80n2; Tue, 10 Sep 2024 18:56:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1725987369;
	bh=6IVX0uCQNd9zCee3e9vv63knqK4j3qT0VDnonUeshHE=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=s+FYJdZo7Fumol7rX0Ymlqbbwkx7JkbOSf7MvZGvdLkUGi9YDB4CQx7TvynwWZsa/
	 3MDYEZXqwtAHW6b9Ev58Jxg0vyZGZ4US9argXgqJv7/JFYKo37FGaft1GxLmBzMLJR
	 VcqJ0O5XGr2R42Do6dRdl3iEgAisZdjG6B0iNczqu91Jbd96BcFvUwpz2HAJTZkFqg
	 0ZYldeTY25CepXoM0G3XR/sjk7FdN01VAwzwQC8M89sUwJCu0a0NsJgI+/s8zC3hwj
	 xQaPr2cXug26WADIv7yXLuMFBPekVlxOyPDR35leKVoiaV8UASjysLKRApW+1OZxNe
	 z7QEi++N8KGrg==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Tue, 10 Sep 2024 18:56:09 +0200
X-ME-IP: 90.11.132.44
Message-ID: <be4bcfa9-6445-4e8a-a510-0777341026b0@wanadoo.fr>
Date: Tue, 10 Sep 2024 18:56:07 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] remoteproc: k3-dsp: Fix an error handling path in
 k3_dsp_rproc_probe()
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
 Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Bjorn Andersson <andersson@kernel.org>, Beleswar Padhi <b-padhi@ti.com>,
 Andrew Davis <afd@ti.com>, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <9485e427a9041cc76cfd3dbcc34874af495e160a.1725653543.git.christophe.jaillet@wanadoo.fr>
 <ZuBlvhf5AszNHV1e@p14s>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <ZuBlvhf5AszNHV1e@p14s>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 10/09/2024 à 17:29, Mathieu Poirier a écrit :

>> +static void k3_dsp_free_channel(void *data)
>> +{
>> +	struct k3_dsp_rproc *kproc = data;
> 
> How did the struct rproc from devm_add_action_or_reset() got turned into a
> struct k3_dsp_rproc?
> 

Well, Linux is a wonderful system, that is able to make wonderful thinks!

In this particular case, if it is not the correct explanation, it is 
likely an unfortunate typo :(
Sorry about that, and thanks for the careful review.
I'll send a v3.


But, looking at it, and trying to see if similar issues may exist, the 
following naive script spots 2 similar issues. 1 of them looks valid.


I'll try to improve it (Julia in copy, if she wants to give it a look 
as-well :))

CJ



@devm@
expression RET, DEV;
identifier FCT, VAR;
type T;
@@
	T VAR;
	...
(
	RET = devm_add_action_or_reset(DEV, FCT, VAR);
|
	devm_add_action_or_reset(DEV, FCT, VAR);
)

@depends on devm@
identifier FCT = devm.FCT, x, VAR;
type T1 = devm.T, T2;
@@
void FCT(void *x)
{
	...
(
	T1 VAR = x;
|
*	T2 VAR = x;
)
	...
}



