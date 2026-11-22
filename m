Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795367375;
	b=uITWJpEriYSWWEGy1TV1UOyq89QNsa7rtyGWSiYbRkDo2e2UM+FNc0L722EhZWjHbU3R
	 dFKWC8y43znkd9DLRRDwTeeb1fUUoUL9ozn19KJD3HCiKdVD0+K/KUZZJ7JqFc5iIaY35
	 cnWS607iRCtlYflDJ7w9VbUABjWXCB0g7Ajx9hthHGpF+yMNlsVkQkpumMmM1cl2r6Atr
	 0wAf4FnioQkQ9OOzO9xUGHK6857b5rSsJq2vjnOi+01yVmIcnSpuaUuE/lImpwMM7I9wc
	 olkUEMPWzKq5AhtkxeZsLTFmP9CacAcy7OLU/6Ooq1bsB3wsrdJofCpEylCPuZGt5xQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795367375;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=iQ9G5wuAOwv32sHYLOPOq6WxkjdWNjuGf0RjBsvIM0Y=;
	b=tW8FaukowrRDUMvnA+NCa9miaLDMN3TIKdnMp/M+LyjmL3Teg/+CooA8a0U1TKnk+aYH
	 weSM7Wa0FzcnUpP0f/x2kipAUIsqOFY/QqOJTYharda0bqrEwIxqJ6BUCOIWIbs+3pGgH
	 akMK0rMNZu1QYB61/uJkxOb/TdwYnrMjnzzPZIJxHMswXuenzYiFm2juz6mG8s7H1xsLK
	 JZQc2vLfo+PE5U3ePY8Bo7w5nafhTz4Qwdw7Q0MxSZjsWyqqx7DME802rzplFKOBVaBDM
	 mFiU0bu7rqmWB3UQyI4H88CBIv5XXx8ZKzCGNe85dJ3HLlQ7ud1OWbFc6Gxxs8O10Yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=asxzsACs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68CBF606A320;
	Sun, 22 Nov 2026 17:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=asxzsACs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 278781F000C0;
	Sun, 22 Nov 2026 17:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795367374;
	bh=iQ9G5wuAOwv32sHYLOPOq6WxkjdWNjuGf0RjBsvIM0Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=asxzsACsMWmw+sV/Pyg/QnwsmIcjhuFrqYyfNks6EzrrwDqgDJxL66+VDMPEpZw4J
	 aLH6aZRUNCMu6+PsLBS2pCsv2dKi8JONYQnG3Sw6KTBpuapkWhMB26i39TMWs71xii
	 LPZJjEpNPfWzZHv3MPPgaX9jSchzd3MXD7lu1dkg8gaDAzVMaw34U9xgmXY5Yq5qpV
	 gaaBeIC5sqrgo+oY8nCcnKdF/5EuxZ9UVtljP3xMGfjB1dUWCSiMO+Xwvj2JGxa8W6
	 Vj8+bIrUCWd2ajfovk87r7utJ3g6dvyIUeHa7nczhTrBOlLfxkEipz6O9qVVSrh2nD
	 QuO5lGQCCxiMA==
Date: Sun, 22 Nov 2026 18:09:31 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ben Levinsky <ben.levinsky@amd.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, michal.simek@amd.com, tanmay.shah@amd.com, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/4] dt-bindings: remoteproc: Add RPMsg resources to
 AMD BRAM rproc
Message-ID: <20261122-dashing-dynamic-agama-d617ec@quoll>
References: <20261119220405.2838553-1-ben.levinsky@amd.com>
 <20261119220405.2838553-4-ben.levinsky@amd.com>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261119220405.2838553-4-ben.levinsky@amd.com>

On Thu, Nov 19, 2026 at 02:04:04PM -0800, Ben Levinsky wrote:
> Add optional mailbox channels and reserved memory regions to support
> RPMsg communication with the remote processor.  The memory regions hold
> the vrings and the RPMsg buffer pool.
> 
> Assisted-by: Claude:claude-opus-5.5

Drop

Please run scripts/checkpatch.pl on the patches and fix reported
warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
patches and (probably) fix more warnings. Some warnings can be ignored,
especially from --strict run, but the code here looks like it needs a
fix. Feel free to get in touch if the warning is not clear.

> Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
> ---
>  .../bindings/remoteproc/amd,bram-rproc.yaml   | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 

With this fixed:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

