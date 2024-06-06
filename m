Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7C444C68;
	Thu,  6 Jun 2024 19:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717701075; cv=none; b=OF2SCzG1OJShmjgddgG38eZ9nT4fhOA2nffjGUT4NuqCCAncQ7bLJcdcrBPDDhzgfdkb3du+RAupVIy4mFuhKJRz0rRwChui1jVHLYkAcpdl+o+Tef3ys4CR7Ideq8+tWvQACH9oV1NHYoRp/RlWxqFaGqOOMd0hUIfhJhVCAEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717701075; c=relaxed/simple;
	bh=aISHoo9eqcpGDfEfq7sQGEadbxdEPOe8NFZxhgBU8jg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nQpVBm+tcN7D4loqAIpSarwpRboZUeuOr8JOMAGq4Xobr/GS8EW8I/9LcUtHtgKdoz3crf/d0XbfJAJjyBTfL3IRLcCRTqtFU+rz/9iBTr68CBGzluxM41kWuNYrYGON5K2OxLIPK4I/l7jj4ZhPweFbJkSkANuvxbGlADQHunA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=P7nZUQUR; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="P7nZUQUR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1717701072;
	bh=aISHoo9eqcpGDfEfq7sQGEadbxdEPOe8NFZxhgBU8jg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P7nZUQURpBOQzSMFx1ivIMnAlTKc51oSoTL53hhjdnM46/9TwJaxSxuFf/LM3Ehhq
	 vdT0dVZ+XBRIfc2ZC0Mjy3zBKTzxjWDO5bpq8Savkqc90SDhxfglSrHHpXmotRmJRM
	 ss1W1Ndc2EayE+ddroBj4y+kZnDdom4lTBSAjtrX/Gx5SmG3jjDNCa+ZXWuh1FjLfO
	 f2twwKH1qJSYP3caT+4zMcTklL33OlXh7Sn19IZQLFy/eE+y52TpZitSQxaX6h6PBm
	 Hv5oY28vXFgXIfUvOxDgSmiGybN0iTau+ldY5O2BNF+qRC08xkdObnxMVSz+2nky2x
	 q3CWPk+cuhg5g==
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 2DA7E378000A;
	Thu,  6 Jun 2024 19:11:11 +0000 (UTC)
Date: Thu, 6 Jun 2024 15:11:09 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, kernel@collabora.com,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] remoteproc: mediatek: Don't print error when optional
 scp handle is missing
Message-ID: <08125ad3-e5c8-4e96-912c-986b0e08b078@notapiano>
References: <20240605-mt8195-dma-scp-node-err-v1-1-f2cb42f24d6e@collabora.com>
 <99d19104-875c-4214-b4a4-4c228cc08b66@collabora.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <99d19104-875c-4214-b4a4-4c228cc08b66@collabora.com>

On Thu, Jun 06, 2024 at 12:50:56PM +0200, AngeloGioacchino Del Regno wrote:
> Il 05/06/24 21:35, Nícolas F. R. A. Prado ha scritto:
> > The scp_get() helper has two users: the mtk-vcodec and the mtk-mdp3
> > drivers. mdp3 considers the mediatek,scp phandle optional, and when it's
> > missing mdp3 will directly look for the scp node based on compatible.
> > 
> > For that reason printing an error in the helper when the handle is
> > missing is wrong, as it's not always an actual error. Besides, the other
> > user, vcodec, already prints an error message on its own when the helper
> > fails so this message doesn't add that much information.
> > 
> > Remove the error message from the helper. This gets rid of the deceptive
> > error on MT8195-Tomato:
> > 
> >    mtk-mdp3 14001000.dma-controller: can't get SCP node
> 
> I'm way more for giving it a SCP handle instead of silencing this print... the
> SCP handle way *is* the correct one and I prefer it, as that'd also be the only
> way to support Dual-Core SCP in MDP3.
> 
> I really want to see hardcoded stuff disappear and I really really *really* want
> to see more consistency across DT nodes in MediaTek platforms.
> 
> So, still a one-line change, but do it on the devicetree instead of here please.

Sure. So the missing scp phandle case is maintained exclusively for
backwards-compatibility. And we're ok that the old DTs will keep getting the
error.

I'll send a v2 adding the phandle in the DT instead.

Thanks,
Nícolas
