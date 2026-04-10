Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D62B3CF66C
	for <linux-remoteproc@vger.kernel.org>; Fri, 10 Apr 2026 14:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775830527; cv=none; b=NMVdTds8J9Ka8RpYWcJ6OuvssILKs+BMcY4Nt258gj5M24K5NA8SrYr51aw6OAjU3u48Z6LWdmVk13dn+1Ws76yuw7aMixk4bctF2uhpMYmWSPRjsh6dKlHAzUzoF+oM1+9BvQDeXaEB9zyDgZy/xdbmABjBCIz0LYOUIFqGORo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775830527; c=relaxed/simple;
	bh=E1l0jTmgEC5CsMfeNjCFriYdo984k07KQLtAz88m2do=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tAeHaQ9lrHcolb5g1hjIisf4MO8lu7v8ZTg/2Rx3twUQxdb9fAJjQTGABynYxOEgYJHsTvUHgQQvnbPQKtQxU8ML/tMefZsu/gqFQ7kyjxph+FLhy8dzxCTEPYI59pLy9WT/e8o2tcY9u1j1tJpoYu5PEvwP/TtK/mY52oTnzgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TuXUXnLC; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TuXUXnLC"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43b949bf4easo1272330f8f.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 10 Apr 2026 07:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775830523; x=1776435323; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a3NTo8KT/D+qioe7D4ssjyh0CGz033ssPrhnPRNkjqU=;
        b=TuXUXnLC5D10WzbAUdz181GEQuLFD4KfavQoqB+1m278TTv35TBSRByrs9sgW31riZ
         jnNOBFuiz8BfVhPPdcH5rFERoVAANwRBjr18EWexjWXBj+sVZr4eSAOh3riElF9AaD1/
         HYsl82LXe3OeiG/vG3KpLJXywH9bBzwRrldD5J5afhhJiEgXoHMZ6czT9PHOy/1pyHWO
         WSUG9+0k6l6PVBhQ1g7Q3sl1pS6Iqg/9izA0gNy64gGQ+DgYXF6DDkAiySt5Ne4TJDhZ
         kSnUanOHZggRv+nGKSBpApl9YDprCflNXFU/COCEUTFujYZxziERKIdcL+QPF8UDi4v/
         DUDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775830523; x=1776435323;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a3NTo8KT/D+qioe7D4ssjyh0CGz033ssPrhnPRNkjqU=;
        b=rkTxyr2Ts7jaRMBn2ZauBZYkJytf2PdA+/l67T9qpYk7Dq1+efhPz1AwncTKV3nZuf
         sshIoa7ahq3htc76422f0yMFt6WncOvalfbVZBGaayCXKTj5cZ7LaBWzNYUZrtD28Wii
         zIJ9WD3wC7+Ov6E4qfRYaDxX0LycaUA6nfSwaQxP9lIgUFW7UtW2lrGECid6azpIO/Z8
         sPCYjKZRRb3s3TH8AuNqYlfyWGAQMfX+U2bfsm7QqIui46/LSew3sQdlSmgy3kKF4GtI
         yTA3tcddw4VNiDwlIbojtI6pFadJvInWQjl+xfcKxzKMb6lCp3BVWjtpMPXUd/jPpUke
         zFNg==
X-Forwarded-Encrypted: i=1; AJvYcCVJbnpFiaqYbHtfE0FDs+3iphqU4zKHSdWE5S1QQ0RC3dMXspcaHrbd7t1fnZhcBAoiWyAkLloP3LGR0sk2fG2O@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ8kxMu+bwVmo+q3GMPUiXRDyJKxGe8wwf0NA6nJQoRHzTcDdQ
	BKMDLda1fMBbcY5naIMllo3sQsZPwTZos2XvPBmG1JW1ZD0CmwnpFPWKZ8soFLveWQI=
X-Gm-Gg: AeBDievZSQbt5UDqi3vMpork999Ok3Y48QwHFUdfSmj4+WCJnAXrlup3HB7hY4S8OJk
	DVRjR8Uc19ApDz6PJqC8cJCh35e9YYI/ZTkXPAn/Qfrn9mItUPR1XQLZ+75t+qsrBvBNCW+jXR7
	JG632x4E3GsUozhHw0xrSInyHyD1mY/kOD9M8JGKC6JKromHjvslIrQd9TzBd2ay9ocu22KNMbp
	0vw4q7kyFZbowc80hNeFhJkZqC0hrvoVUSHoHmELnbBWc6y5c74QYVXiJOvk7YgVNd+gEx1J58t
	AMa6PAsG+Yj5MS7zeIn+5b0E2l7dLVOTID0VLIGa8ULhCbdR2RXXulSsWLct1uY2PNzJe3ewWKL
	+eGgswmyyBUpJMan7kZcSwHG7x0TmxKQJ34fb0BPElxmlwBC4GAUR6ifeJeUJHhRPfmPgfwiQxc
	iS+0x4TCfdDLJUGPwvSiTTe6SeEUVvM1akVsb3DQU=
X-Received: by 2002:a5d:64c6:0:b0:43c:edaa:f5e7 with SMTP id ffacd0b85a97d-43d64974247mr5109018f8f.14.1775830523250;
        Fri, 10 Apr 2026 07:15:23 -0700 (PDT)
Received: from linaro.org ([77.64.147.107])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63dec3b6sm7544941f8f.16.2026.04.10.07.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 07:15:22 -0700 (PDT)
Date: Fri, 10 Apr 2026 16:15:08 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
	trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/2] remoteproc: qcom: Check glink->edge in
 glink_subdev_stop()
Message-ID: <adkF7EY1KVRNO01o@linaro.org>
References: <20260409-rproc-attach-issue-v1-0-088a1c348e7a@oss.qualcomm.com>
 <20260409-rproc-attach-issue-v1-2-088a1c348e7a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409-rproc-attach-issue-v1-2-088a1c348e7a@oss.qualcomm.com>

On Thu, Apr 09, 2026 at 01:46:22AM -0700, Jingyi Wang wrote:
> For rproc that doing attach, glink_subdev_start() is called only when
> attach successfully. If rproc_report_crash() is called in the attach
> function, rproc_boot_recovery()->rproc_stop()->glink_subdev_stop() could
> be called and cause NULL pointer dereference:
> 
>  Unable to handle kernel NULL pointer dereference at virtual address 0000000000000300
>  Mem abort info:
>  ...
>  pc : qcom_glink_smem_unregister+0x14/0x48 [qcom_glink_smem]
>  lr : glink_subdev_stop+0x1c/0x30 [qcom_common]
>  ...
>  Call trace:
>   qcom_glink_smem_unregister+0x14/0x48 [qcom_glink_smem] (P)
>   glink_subdev_stop+0x1c/0x30 [qcom_common]
>   rproc_stop+0x58/0x17c
>   rproc_trigger_recovery+0xb0/0x150
>   rproc_crash_handler_work+0xa4/0xc4
>   process_scheduled_works+0x18c/0x2d8
>   worker_thread+0x144/0x280
>   kthread+0x124/0x138
>   ret_from_fork+0x10/0x20
>  Code: a9be7bfd 910003fd a90153f3 aa0003f3 (b9430000)
>  ---[ end trace 0000000000000000 ]---
> 
> Add NULL pointer check in the glink_subdev_stop() to make sure
> qcom_glink_smem_unregister() will not be called if glink_subdev_start()
> is not called.
> 

You mention the actual root problem here: Why is glink_subdev_stop()
called if glink_subdev_start() wasn't called?

The call to rproc_start_subdevices() in __rproc_attach() makes sure that
all subdevices are in consistent state when exiting the function (either
prepared+started or stopped+unprepared). Only if all subdevices were
started successfully, the rproc->state is changed to RPROC_ATTACHED.

In your case, attaching the rproc failed so the rproc->state should be
still RPROC_DETACHED. All subdevices should be stopped+unprepared. We
shouldn't stop/unprepare any subdevices again in this state, they all
might crash like glink does here.

We know that subdevices are already stopped+unprepared in RPROC_DETACHED
state, so I think you just need to skip rproc_stop_subdevices() and
rproc_unprepare_subdevices() inside rproc_stop() in this case, see diff
below.

Thanks,
Stephan

@@ -1708,8 +1709,9 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
 	if (!rproc->ops->stop)
 		return -EINVAL;
 
-	/* Stop any subdevices for the remote processor */
-	rproc_stop_subdevices(rproc, crashed);
+	/* Stop any subdevices for the remote processor if it was attached */
+	if (rproc->state != RPROC_DETACHED)
+		rproc_stop_subdevices(rproc, crashed);
 
 	/* the installed resource table is no longer accessible */
 	ret = rproc_reset_rsc_table_on_stop(rproc);
@@ -1726,7 +1728,8 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
 		return ret;
 	}
 
-	rproc_unprepare_subdevices(rproc);
+	if (rproc->state != RPROC_DETACHED)
+		rproc_unprepare_subdevices(rproc);
 
 	rproc->state = RPROC_OFFLINE;
 
