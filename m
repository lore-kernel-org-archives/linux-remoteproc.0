Received: from mail.nic.cz (mail.nic.cz [217.31.204.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9C53B840E;
	Wed, 15 Jul 2026 08:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.31.204.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784102897; cv=none; b=ab0Cc/Zbotwg/bBW1U22yaQbdXsuqzynsGlos1S0krou42EIQbPRKMqiRDLaqAIRqnBIivQNlf7sokA1jhnsn0Gsv421CgxupGWjth82eBTAe7k2G0rOoKMiFMbWBYp7TXu81E9u5cQe1G3K/+frLfwJmJnWt5Cuxf/Jsxu1yoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784102897; c=relaxed/simple;
	bh=GFAYUtukJF+MHFTRC5bun5hBzgtIdadBRBey+EsqaAI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gnx9XEZfZFXGqrqsouRLzcrqGsCS7LD5aoMDrII2pEQYeVGEIRdU2bRIE38KqLhKfM7/gDh69dJBZcH4mnHUy9kFhIMHkku47N56vUR0RIvASCP2A7IBelGGBF/6smD7Nb0jC6X+kMbVkEGkNZtLQFCSDzr6ihQ4locjaUJ++MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nic.cz; spf=pass smtp.mailfrom=nic.cz; dkim=pass (1024-bit key) header.d=nic.cz header.i=@nic.cz header.b=AUUNKwQ/; arc=none smtp.client-ip=217.31.204.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nic.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nic.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nic.cz header.i=@nic.cz header.b="AUUNKwQ/"
Received: from solitude (unknown [172.20.8.54])
	by mail.nic.cz (Postfix) with ESMTPS id EAB931C1245;
	Wed, 15 Jul 2026 09:58:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nic.cz; s=default;
	t=1784102293;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=i3zoHmlfQB2+efQVK7taddCp6UGty1k40LZdxplgHdU=;
	b=AUUNKwQ/rjfhS/ST/CMSQWG8U4ytjFPDFkPEtL5q4Ipya+EFBk9kVhjPNl+dwaAfa9zCSg
	vHpnRcQfely6XOtn1859PTzrmX+WSRVCCzQlzmMj6Ymk9FeqiHEbtpndlCUSr2B5VAsxJK
	6ho7LTJwgdPeE1Ia5OxUXy3Q/FiDQaQ=
Authentication-Results: mail.nic.cz;
	none
Date: Wed, 15 Jul 2026 09:58:09 +0200
From: Marek =?utf-8?B?QmVow7pu?= <marek.behun@nic.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
	 Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>, Alexandru Gagniuc <mr.nuke.me@gmail.com>
Cc: krzk+dt@kernel.org, mturquette@baylibre.com, 
	linux-remoteproc@vger.kernel.org, mathieu.poirier@linaro.org, robh@kernel.org, conor+dt@kernel.org, 
	konradybcio@kernel.org, sboyd@kernel.org, p.zabel@pengutronix.de, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/9] remoteproc: qcom_q6v5_wcss: add native
 ipq9574 support
Message-ID: <jhl7fic36ec36pyaduw6xtmgvr75sxurngdykljbovdbt2j23g@ezon25dsv3hg>
References: <20260109043352.3072933-1-mr.nuke.me@gmail.com>
 <178370682987.2572738.13491033810212556744.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178370682987.2572738.13491033810212556744.b4-ty@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.10 / 16.00];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[dt];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,gmail.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	WHITELISTED_IP(0.00)[172.20.8.54];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[nic.cz:s=default];
	FROM_HAS_DN(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	LOCAL_OUTBOUND(0.00)[];
	MIME_TRACE(0.00)[0:+]
X-Rspamd-Server: mail
X-Rspamd-Queue-Id: EAB931C1245
X-Spamd-Bar: /
X-Rspamd-Pre-Result: action=no action;
	module=multimap;
	Matched map: WHITELISTED_IP

Bjorn, Alexandru,

there is another, much newer series by Varadarajan adding ipq9574 to
wcss PIL driver,

  https://lore.kernel.org/linux-remoteproc/20260713-rproc-v13-0-41011cbcda3e@oss.qualcomm.com/

I suspect these two series are incompatible.

Marek
