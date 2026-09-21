Received: from mail-pz2-f20.google.com (mail-pz2-f20.google.com [74.125.228.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1D53BD24A
	for <linux-remoteproc@vger.kernel.org>; Mon, 21 Sep 2026 14:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790001314; cv=none; b=VfrPFN9bHuNEYN3FbFs4m8YXRlAm4d4EgtWO5LBIO7dRbgIrJHVQG+FsvHA1XfsF/cDgOshGl89D6nPcc4lx0SZ/W1U1qM3fQ45T5gl//02QNBfxKjXkVkhnR+X70YDc/c0isjNAC1XMG3bpT90DBP5K5IY4VQh63njg2pgVP/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790001314; c=relaxed/simple;
	bh=sA4lI2lBGJ52fPSuUba4swVIpDFqTfeHw7dRAx0QfQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jHQzUJn9OzAaicZ29DbpgwbvL5rBsCvby7WIfQSKpkg2yka/vG8T2PsrxzkvLNrXUG9uGnn1K7SmDel1gpfZLllJY4m4kMrvskkVYl9GstIM1dDchpTE3q/OrM7l9YELLGoUDxQ/+SIXSncJ5RxbRNTQFo2e74dh/2lbVuPWtKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xu8nStZZ; arc=none smtp.client-ip=74.125.228.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xu8nStZZ"
Received: by mail-pz2-f20.google.com with SMTP id 41be03b00d2f7-cc1cebad4afso2166956a12.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 21 Sep 2026 07:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790001312; x=1790606112; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hfZR9R0SCegSVDBBWPoNtONrcmPVVQ0j3HivTzcIiSo=;
        b=Xu8nStZZyrvrnANFNuhltSd1tyVmcO14h+LI3z5mfEKugIkykwhxkG+5D3/YdoHfDm
         HZhJen1JI/KSgR23nWGWDlZp7yXd0k/gHFQaOCy7SVt2QTDm0lJ6R38BkbBSzhpQTucp
         k/sgel09DN3NGxj0wzF5kkDox+puB6gQqW2jQ3FUw5Rmxdnw5kC6EtfjWUeuv1BOh7Ax
         7FAMzSEyck6w3OXE5a+uI13rlRCArwq0DfG2VLrEBise2wajPwvB5N6fvmg+zaNP4v90
         L4ydRtF1wUJf5BcuH0hO+MwFNyfCKC6A3RMjcOvE+w3vh2p7tirMvzrgJ77BL8TxMN7x
         h88Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790001312; x=1790606112;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hfZR9R0SCegSVDBBWPoNtONrcmPVVQ0j3HivTzcIiSo=;
        b=1gpFFljpX1feso4KyF6/OTR8eveIhqudsqsagtjbioVUFLAkfXZDFJMUqbN8FYpWA1
         7C7/AfNEmFU0TxLceUR47h+fLuaOqxaYLJQr30NF/GJZSbHZXcURLthGjkQM5fyDNqXU
         uI6X7ApKXjHsJwT/co9d42v8/Una49k9ewRYmEs5oZC8Q/aCe7y7qUYZISDS5Z/Abiw8
         sy1KnP8OaQOTel2fLszv5GPcZ0TROY8XKuInUa2M4UCiZBEv/Tk2+qcmTaTVA8+Pkgu/
         aE9wYHb4hOkA2ax9vIqxFsJYQacC0j0dv7s5IFJVS4rWIl/e6ZZIz2zp2kcgPLAQNtOs
         yn1Q==
X-Gm-Message-State: AFuF++mk5S2H4LqOYLfyKiMupzIpaty9aDo53m4qSvLEEhNcj6CZe53o
	6M7mNPgTLh3BbE9fmmm/nKCQqDlm1CTpd7FIf7eHHyZtOZN2nIATEzhwgq3r/StJK9w=
X-Gm-Gg: AYBFou1mlR5AdeFyU5aNAU1qs6n1Xjx49bz4BxODWInBeDiJlKaJvFG7VBzs39kUIxV
	q7aLDLiMlcIOSC2t5cyCGZU1qxJuw5hN3YC82o5HmDZ+4oY0gti+yfa/tE8Pn9X3lovJkXT3z+Z
	TlR1+n42ALBbvQd/PYe5megWMgRSArUhgdxU92TGQU1jgwMBTg6oozlbgoAf/kIfw8rT69PTHNR
	5us8CwS8/jJuVfY9z3u6nHJb8NAggD+3RRdDhmbtgHdU9S+EVhhnH5MYxc4Vcb0+Gh6JCgjkVC8
	Jn1UsUihMLs3fSpF2y1o9X3lfxN8vxv1idn2IsdpYrmIkOtzGCNObVROVd8+w3b3BU5V70Qrxrl
	RdzfKobUNjxz7E3KzhHWZIULxzflrc3CgHJ8f7fcU5hfpqL7o1hYcZ2lspn5xcYP8tDxdxRvDq7
	8kwUNE7b3710NoyIubZCHWeq3/VpIuapAnVKwm91lmmbOWcNz65NpeuX8tKJd7k+GOOKaI5/Q3/
	g==
X-Received: by 2002:a05:6a21:1398:b0:3bf:b182:94e with SMTP id adf61e73a8af0-3dd8c3f18d2mr16821649637.5.1790001311995;
        Mon, 21 Sep 2026 07:35:11 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:a714:d1ef:56ba:be47])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc72a26d5casm3509727a12.0.2026.09.21.07.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 07:35:11 -0700 (PDT)
Date: Mon, 21 Sep 2026 08:35:09 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-remoteproc@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>
Subject: Re: [PATCH] remoteproc: Use %p for pointer formatting
Message-ID: <arFAnRCt-TykCbt3@p14s>
References: <20260918104628.jqQhAlF-@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918104628.jqQhAlF-@linutronix.de>

On Fri, Sep 18, 2026 at 12:46:28PM +0200, Sebastian Andrzej Siewior wrote:
> Commit 276ec9934231e ("remoteproc: replace "%p" with "%pK"") introduced
> the %pK in order to not leak kernel pointers.
> Since commit ad67b74d2469d ("printk: hash addresses printed with
> %p") pointers are hashed by default and the behaviour can be controller
> by `hash_pointers' boot argument.
> The policy on %p is to not introduce new ones.
> Removing %pK makes it possible to remove its handling from the library.
> 
> I doubt printing the address of struct fw_rsc_hdr with an unknown type
> brings any value. The va is printed already in debug output in other
> places as %p so it makes probably no difference to remove it from
> rproc_carveouts_show().
> 
> Use %p instead %pK for rproc_mem_entry::va, remove the address of the
> unknown type.
> 
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
>  drivers/remoteproc/remoteproc_debugfs.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>

Applied.

Thanks,
Mathieu
 
> diff --git a/drivers/remoteproc/remoteproc_debugfs.c b/drivers/remoteproc/remoteproc_debugfs.c
> index b86c1d09c70c0..e8e7b6a3769b8 100644
> --- a/drivers/remoteproc/remoteproc_debugfs.c
> +++ b/drivers/remoteproc/remoteproc_debugfs.c
> @@ -347,8 +347,8 @@ static int rproc_rsc_table_show(struct seq_file *seq, void *p)
>  			}
>  			break;
>  		default:
> -			seq_printf(seq, "Unknown resource type found: %d [hdr: %pK]\n",
> -				   hdr->type, hdr);
> +			seq_printf(seq, "Unknown resource type found: %d\n",
> +				   hdr->type);
>  			break;
>  		}
>  	}
> @@ -367,7 +367,7 @@ static int rproc_carveouts_show(struct seq_file *seq, void *p)
>  	list_for_each_entry(carveout, &rproc->carveouts, node) {
>  		seq_puts(seq, "Carveout memory entry:\n");
>  		seq_printf(seq, "\tName: %s\n", carveout->name);
> -		seq_printf(seq, "\tVirtual address: %pK\n", carveout->va);
> +		seq_printf(seq, "\tVirtual address: %p\n", carveout->va);
>  		seq_printf(seq, "\tDMA address: %pad\n", &carveout->dma);
>  		seq_printf(seq, "\tDevice address: 0x%x\n", carveout->da);
>  		seq_printf(seq, "\tLength: 0x%zx Bytes\n\n", carveout->len);
> -- 
> 2.55.0
