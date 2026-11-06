Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.56.87.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794000601;
	b=fFft3lL/kKZL1OHUrzt/LVeNZ0JaVv+++HtFOVfZd46CIK7RrSfzNY1X6lctlzpEK0It
	 mmz9mTyWTtw9iHjk8fhaMOvGax6zoB90mNTuaANLan0anNE7XLn8VOKmpqO5LyAlkBi6p
	 DkgutARU3b+9U+xD+Owr8S9hh8JxbYoMqn+jS1ffty/rUrMAYFfH7X1HHqwyszabQ3kZe
	 SwP8BwU6r+vK+/CwuZPaQ9EQeFu9gChe1ItUuhmE4VQPkyBTi5ygu4DDvL9AOxe04HzGo
	 26bshiWgbz+jCwD0hRR0TrxQmCuMOTSNOoxFzDRzjyK5pvbUfxE04g+/GKBHwxLN6LA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794000601;
	h=DMARC-Filter:DKIM-Signature:Received:DKIM-Signature:Received:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-Source:X-Source-Args:X-Source-Dir:
	 X-SGantispam-id:X-AntiAbuse:AntiSpam-DLS:AntiSpam-DLSP:AntiSpam-DLSRS:
	 AntiSpam-TS:CFBL-Address:CFBL-Feedback-ID;
	bh=uCH0heD6adad/Xq2GD/9BLloDu46ohT1wFuHjeE10ak=;
	b=5oQ/W7GLEfavABE1Lg3hYOD23zLE+YxiJBZhiseOAsdRMyoLHTXNQ5h4SuADHDNFEjz/
	 LkG1/DhxU5LvFC3RzcEqzozjJ1yfUqwZX5mnAViE65l+pn2UG1UpyPpLmXopPc/s0F6Fx
	 mk3DpWdinLXYdDyBGa09/vjNuI2swIyCQEizwCr2NOLJ9r8YPx8s+JICfqk8mrvqqSrwp
	 +37hjj4ZC6EBqyeTkHMM0iIlYNxsQcgFwuIaI3PhEovrCuNY8mcaajtiEN71Cx2wU8OHP
	 zo0ekzmi/Z8VXrTooe5oWECcBb7zx3tyh7b8e20KLw7UcoOUGtD2spGmn53tuQ+unUw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=valla.it;
	spf=pass smtp.mailfrom=valla.it;
	dkim=pass header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=ItkqivsU;
	dkim=pass header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=fT65mv3M;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.56.87.11
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 840CC606A326;
	Fri,  6 Nov 2026 21:30:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 840CC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=ItkqivsU;
	dkim=pass (1024-bit key, unprotected) header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=fT65mv3M
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-ssp3.prod.antispam.mailspamprotection.com; s=arckey; t=1794000600;
	 b=fvXbWsPd95yfJpAGRVeJz6pHxg6a1mrrCdfeJDKSDq58D4dgG6DDeteOz9e91hwvtD1fBxrn6+
	  B8ZA9LjhDXFv6WXjrJWhpowj0sm2ljysZ3eGbZLsI7AViXzxvHr5KlzUUK3gA1oZj38HpJaU2C
	  ohfUpAVaV7/Gou926mL57y0A6GodFnpwcYjDxCYz0V+EU7hyMTzkFXDN3NdM1FkeCTOyv6osut
	  vVPFIv3jMLmc82TRojaqMe/kGaCnuEco4x715AbHG5a9V1tx5XU9b1B48SC22/06NtLJZJVbDf
	  CS7DGE5EsYhwKHXXeSd2VhtVMLb7PwEZOrDNvFthW6vt8w==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-ssp3.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-ssp3.prod.antispam.mailspamprotection.com; s=arckey; t=1794000600;
	bh=29nzGDsPB2jHq99FxBQgRaZjFwvsIG+I8xefK5ehP2I=;
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:
	  From:Date:DKIM-Signature:DKIM-Signature;
	b=JmIS13xEfFw3vs7CcyPSQej5Hg7oT+7pRWDzFIM68ZR50+tGfjggfs2CezmsTWs1eUaeSTgzur
	  1Wy3Pa8L9H4tseFbRrSwBPOHX9rvJ4lrH6SFdHQySJhtozUtDGYSBHiIjEYVu8JQJ0Jlk1csyl
	  fH7EbuVZN8CGzBoyu4vrA2bg5nkShFy8IHSfncPctHLd88p17yXj5uMbUWzDTFHnVmkW+7JjOz
	  u3ma+rLuewXyOaOZToiBE7FsrnVqyRkNQI3/rH9wMnCtWp7AiI3U8GLtemzJVYBU/LfcOlrOjj
	  97LK+Y4+tXKvksG12ev9NSYQZ92zbNqs1qCpVFJmDtDqzg==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	List-Unsubscribe:Content-Transfer-Encoding;
	bh=uCH0heD6adad/Xq2GD/9BLloDu46ohT1wFuHjeE10ak=; b=ItkqivsUsN88Coz18qgQDULEXK
	yMXgI4Oq9d2tED8QiZKQ9h8yPGTkZfaO9wsfTy7WI2VIZlIUAQVNsWl7xU+2s2myv/ecYEmv2BIzj
	/Hu7A0pIiN/ch65YHzmL07ukK05AbChefQCAPH2quYbHZIhV3noRZtB5fadxEUzlL/Oc=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-ssp3.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xPRVP-00000009h65-3nGy;
	Fri, 06 Nov 2026 21:29:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Subject:Cc:To:From:Date:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=uCH0heD6adad/Xq2GD/9BLloDu46ohT1wFuHjeE10ak=; b=fT65mv3MQqF4bVacot1ZCgUFEL
	nsSN0sSh9tl/M+Qlal0OLEXch1IlBD28Bmtc4K1Sk1MZiZUwHNb2pN8auZLPQcNXSIX38BoTg/Vfv
	GmlqdSPwiMdr+XAbVFFqWQdAYxYZt2i1S62A4jIhQJBszDv+XEhhHYS0PQlBUDxAvJW0=;
Received: from [79.17.15.196] (port=63375 helo=bywater)
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xPRVL-00000000D0U-01FZ;
	Fri, 06 Nov 2026 21:29:47 +0000
Date: Fri, 6 Nov 2026 22:29:45 +0100
From: Francesco Valla <francesco@valla.it>
To: Daniel Pereira <danielmaraboo@gmail.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, 
	linux-remoteproc@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v2 08/11] Documentation: remoteproc: expand virtio
 support section
Message-ID: <au5GNZqGkN-0Qn84@bywater>
References: <20261102-remoteproc_virtio_map-v2-0-26b300e01c62@valla.it>
 <20261102-remoteproc_virtio_map-v2-8-26b300e01c62@valla.it>
 <CAMAsx6dogk20pTtpGaD_Ci2fam01UuUEe3KXDTH7UVjwRBRqnw@mail.gmail.com>
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
In-Reply-To: <CAMAsx6dogk20pTtpGaD_Ci2fam01UuUEe3KXDTH7UVjwRBRqnw@mail.gmail.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: e01cf15abfe6fa66a811bff9bc2e1f62
X-AntiAbuse: ID - e01cf15abfe6fa66a811bff9bc2e1f62
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xPRVP-00000009h65-3nGy-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-ssp3.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

Hi Daniel,

On Tue, Nov 03, 2026 at 11:15:23AM -0300, Daniel Pereira wrote:
> On Sun, Nov 01, 2026 08:28 PM, Francesco Valla <francesco@valla.it> wrote:
> >
> Hi Francesco,
> 
> I only have a few language nits:
> 
> > +supplied by the remote processor should be marked as dynamically allocable,
> 
> "allocable" -> "allocatable".
> 
> > +try to allocate it using dma_alloc_coherent(), which will resort to allocate it
> 
> "resort to" takes a gerund: "which will resort to allocating it".
> 
> > +either from the first ``restricted-dma-pool`` region associated to the virtio
> 
> "associated to" -> "associated with". The same wording appears several
> times in the patch (e.g. "associated to the virtio device's parent"), so
> please fix all of them.
> 

All the nits will be addresed in v3.

As you may have imagined (also considering that my email address' domain
gives me away...) english is not my primary language, so any correction
is more than welcome.

> Thanks,
> Daniel
> 

Thank you!

Regards,
Francesco

