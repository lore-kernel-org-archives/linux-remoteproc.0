Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B456447ACC3;
	Tue, 15 Sep 2026 11:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789472650; cv=none; b=Nl9NbKOiOLn9YDz2hreKqis9zc3qH9HgggPpEFO5I4x9YPShdxxZeGP7UiWaodOTiBcqDxbovuRntFe5HSjFS4aZHZ1NnyIZ4VLlukfHJSdQYsBuPWMaX0fs3P5UlrpC/L7sUwQ53RqhrPZjILYIH7n8g1MFZe812ZAVOLgRKhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789472650; c=relaxed/simple;
	bh=RWNB4M3mtfE/OBaoNeevmZcNdaSwpa9yXiW/qjVzEFA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kaOBaQHBFwvA/1iX+/fAeZrqUE5MRNRP4g7i9rmd8TTZYngefBdpUokdgEs0nhjxOCerZ56aFDQ3YRhr0n2/adhYvxxNLuUXvhrTG6nehzq6G+j0mPFqeugb/swgCXGePVrJnPFyr7PSzgt7rWCP/xTlFRv0jimMrKxKBmPHijc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=aSwirprV; arc=none smtp.client-ip=188.68.63.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="aSwirprV"
Received: from mors-relay-2501.netcup.net (localhost [127.0.0.1])
	by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4hkg9b4Kd9z5x9Y;
	Tue, 15 Sep 2026 13:42:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1789472547;
	bh=RWNB4M3mtfE/OBaoNeevmZcNdaSwpa9yXiW/qjVzEFA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aSwirprVK3ltpuaeTwYXl93fVeFC1Nc+yQetUFyjjNcLWmGtT/5Y5r+ye/UQVSSgM
	 075NTjwlseQ+FeLJ0X1apFH6i7XbzRdssAoPKwIXyFhocQCL37MEYAYNOLpA4ene3M
	 xJ3VrmDx6/LeFrhYGy5GwZzNFtkUmvyING6tLGyAf9VxD+SShfiZa21aZn3hWnVN69
	 mWJwjjOQN/ew6dD3ZG1Aq7Qai4Xlr1ZU05+2+KgMO6Ly1wPH0LtEe+dRd3inI2vVVK
	 hPHAqqNoVR4yhPL+n9QEa2UQUDYp0KdLJTyS+9az6KqMyZwwN/Re91fvo5P+0EtZA2
	 Zs0/m0gULf0mw==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4hkg9b3byDz4yj9;
	Tue, 15 Sep 2026 13:42:27 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4hkg9Z3xY6z8sbH;
	Tue, 15 Sep 2026 13:42:26 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 8FDA95F9F3;
	Tue, 15 Sep 2026 13:42:21 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <1ca948c6-522a-4aee-88fc-b7febe2a6369@leemhuis.info>
Date: Tue, 15 Sep 2026 13:42:20 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: qcom_q6v5_mss: Don't require PAS for memory
 protection
To: Bjorn Andersson <andersson@kernel.org>
Cc: Sumit Garg <sumit.garg@oss.qualcomm.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Paul Hollinsky <phollinsky@holtechnik.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Konrad Dybcio
 <konradybcio@gmail.com>, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
 cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev
References: <20260821081540.89137-1-phollinsky@holtechnik.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <20260821081540.89137-1-phollinsky@holtechnik.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <178947254210.1455081.5673122499047825926@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 8FDA95F9F3
X-NC-CID: qqLS45NP+SSf4O9OUGQeHr3DnUpW8sXo7Nk5Q4XiFKQgpKqs45w=

On 8/21/26 10:15, Paul Hollinsky wrote:
> Commit f3b1357673dd ("remoteproc: qcom_q6v5_mss: Switch to generic PAS
> TZ APIs") changed the probe-time gate for need_mem_protection platforms
> from qcom_scm_is_available() to qcom_pas_is_available(). Memory
> protection in this driver is implemented with qcom_scm_assign_mem(),
> which is a TZ service distinct from PAS. The only PAS call in the driver
> is qcom_pas_mem_setup(), and it is already guarded by need_pas_mem_setup.

Bjorn, will you send this fix for a 7.3 regression to Linus any time
soon? It's in -next for two weeks now as b853857293584d ("remoteproc:
qcom_q6v5_mss: Don't require PAS for memory protection") afaics, but
from the branch name it sounds like it might be queued for merging in
the next merge window.

Ciao, Thorsten
> No descriptor sets both flags: sc7180, sc7280, sdm660, sdm845, msm8996
> and msm8998 set need_mem_protection only, while msm8937, msm8940 and
> msm8953 set need_pas_mem_setup only. On TrustZone firmware that does not
> implement PAS - for example SC7180 Chromebooks, where call-availability
> queries report every QCOM_SCM_SVC_PIL command as unavailable - the modem
> consequently never probes:
> 
>   platform 4080000.remoteproc: deferred probe pending: (reason unknown)
> 
> On those machines the modem is also what loads the WLAN firmware, so
> ath10k never receives QMI and wifi does not come up either.
> 
> Gate memory protection on SCM availability as it was before, and require
> PAS only where a PAS call is actually issued. Keeping the SCM check
> matters: qcom_scm_assign_mem() passes __scm->mempool to
> qcom_tzmem_alloc() without testing __scm, so dropping the gate entirely
> would allow a NULL dereference when qcom_scm has not yet probed.
> 
> Fixes: f3b1357673dd ("remoteproc: qcom_q6v5_mss: Switch to generic PAS TZ APIs")
> Link: https://lore.kernel.org/r/20260808034716.58888-1-phollinsky@holtechnik.com
> Signed-off-by: Paul Hollinsky <phollinsky@holtechnik.com>
> ---
> Reported and analysed in:
> https://lore.kernel.org/linux-arm-msm/20260808034716.58888-1-phollinsky@holtechnik.com/
> Konrad agreed with this shape in
> https://lore.kernel.org/linux-arm-msm/b63e93e4-2f4c-4cad-b726-e1b0565379d7@gmail.com/
> 
> f3b1357673dd is not in mainline yet, so this is based on
> remoteproc/rproc-next; it would be good to get it in before that branch
> is sent on.
> 
> Tested on a Lenovo IdeaPad Duet 3 (sc7180-trogdor-wormdingler) on
> next-20260805, which carries the same code: with this applied the modem
> probes, mba/mpss load, and ath10k_snoc gets its QMI handshake so wifi
> comes up.
> 
>  drivers/remoteproc/qcom_q6v5_mss.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index bef198b9ee63..2f71ed2feff6 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -2079,7 +2079,16 @@ static int q6v5_probe(struct platform_device *pdev)
>  	if (!desc)
>  		return -EINVAL;
>  
> -	if (desc->need_mem_protection && !qcom_pas_is_available())
> +	/*
> +	 * Memory protection is done through qcom_scm_assign_mem(), which needs
> +	 * SCM but not PAS. Only the memory setup path issues PAS calls, so
> +	 * requiring PAS for every need_mem_protection platform prevents the
> +	 * modem from probing at all on TZ firmware that offers no PAS.
> +	 */
> +	if (desc->need_mem_protection && !qcom_scm_is_available())
> +		return -EPROBE_DEFER;
> +
> +	if (desc->need_pas_mem_setup && !qcom_pas_is_available())
>  		return -EPROBE_DEFER;
>  
>  	mba_image = desc->hexagon_mba_image;
> 
> base-commit: bb840ea69347aff7bde5a208e7b5b180669a7656

