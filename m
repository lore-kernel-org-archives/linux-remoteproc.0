Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793776395;
	b=Ej6Q9nd2dXuo4GfY2vew9bktAdQZYzlJKzczSEDXuZogDLAqx0HPETFOOAy4oBgFcecl
	 CywUcG4Z25w05xWnBpGtt3YnmfAHcX1JVz1airYKTLm1l9nmwzIweWClmJ7Ik85symk4j
	 pFx+fkABk/wyNmkAWfv6mfo0vWCdasRHp3alpSdDbTcoXk8+vzaRk6blMB+BacmoCSuG3
	 pCijr2KSJ0MOUixTphcoe/ZWC6ERVr9Ij4P34NuUvG4tAV1h3ZsBYyj/VVXFDu7sYcUgi
	 +7kGoF2gGrpXlTeoNL6f8P/f4OQrfSdQ8yBu4uqbq2CRKSSbfqOaLRFqAYNIttdrRpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793776395;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=fJTSNxSnioFP9GATpW5sCxSNt1pcTEf7ht/AsyK118c=;
	b=zzfuRtIuGZvgWy+8opoOoxPnU31a6ZG9FlbKl0WsHURmo5xw+0NHNV9pX2hazMJxz8Cy
	 tSMZ3JgNhhWVpEnK1R0tlqHlpyGDcU4Bc1HMSfMB3APxct64rZCyhxL88/IpeeLlYGgym
	 xZZBtI68kWhMQr1JP/urwayNiHlqhV6veS8LGyjWCXbhZ5ZWHiefMpZhbkQvqZuZTdDai
	 ZyVhR2h0WytPW6cbKC+YWstDhIXn77KqE+ahNt0/NiT17E9Z4Sj2Ga8Fr5U5AaYO5aYNs
	 oK99/HoiReHFORJx9ho3X3L22gPdouVb/oznwrfpqpHQufPBBBV73xXIxj9QY02gABA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J0GzdtnC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23760606A329;
	Wed,  4 Nov 2026 07:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J0GzdtnC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 395831F000C1;
	Wed,  4 Nov 2026 07:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793776395;
	bh=fJTSNxSnioFP9GATpW5sCxSNt1pcTEf7ht/AsyK118c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=J0GzdtnCM16sGjWwYhpzdYDVmZ3Rk27l4Pmlk/xvMCFmwHX81s2OcMduhzLAWX1nT
	 N244fDZA5ygY3wO/ZekpU0FKqj7JOd4TCC4xnY/es/4YMeXaVKXEAuaBBu7LEDf5HK
	 R8nz6p1C3Sxf6SdlSl18HFEPQEwx+gTQI3SBZS+Sn9zj5PMhDuMSpyd7OLsGyk9jd6
	 0iUdOpYL8t2RFqmH16qn2UadpAVFMkngZmvnhTLBU+89ir/ZOfdtJb/6hvFSyQspaE
	 mKZj1xJDQ9SYN03a7ncYTaXJ9LjbWWjMKGZDcKd9UihIOe5UPDaA53xk0+k1aEVwBG
	 FVAPzYydSD45g==
Date: Wed, 4 Nov 2026 08:13:12 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>
Subject: Re: [PATCH] rpmsg: qcom_smd: drop the OF node reference on edge
 release
Message-ID: <20261104-lovely-smiling-malkoha-5b6abf@quoll>
References: <20261104021357.1467778-1-vulab@iscas.ac.cn>
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
In-Reply-To: <20261104021357.1467778-1-vulab@iscas.ac.cn>


On Wed, 04 Nov 2026 02:13:57 +0000, Wentao Liang wrote:
> qcom_smd_parse_edge() takes a reference on the edge's device node with
> of_node_get() and stores it in edge->of_node.  The error path drops that
> reference again, but on success it stays in edge->of_node for the
> lifetime of the edge and qcom_smd_edge_release() only frees the
> channels and the edge itself.  Every registered edge therefore leaks
> one OF node reference, and so does the qcom_smd_create_chrdev() failure
> path, which also releases the edge through the same callback.
> 
> Drop the reference in qcom_smd_edge_release(), where the edge is
> destroyed.
> 
> Fixes: 53e2822e56c7 ("rpmsg: Introduce Qualcomm SMD backend")
> Cc: stable@vger.kernel.org
> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/rpmsg/qcom_smd.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Multiple things here:
1. Your team ignored completely previous feedback. Multiple times.

2. You use multiple identities with this email address, thus I doubt that we
   speak with an actual person.

3. Your bot does not even bother running checkpatch, right?

4. Nothing of this was reproduced nor tested.

5. Finally, the same feedback:
You sent multiple independent patches, to multiple independent
subsystems. The amount of these patches clearly suggest this was
AI generated and most likely not tested.

More importantly, you sent all this work without properly organizing
relevant patches into patchsets. This makes reviewing difficult
and might cause multiple reviewers to address the same issue.
Replying to the entire set is impossible and requires handling each
patch independently, instead of applying or discarding the set.
Maintainers also won't see the bigger picture of your work. Quite
worrying.

This is on the verge of hostile patch: bomb us with so many
contributions, we won't be able to handle them in efficient manner,
like responding ONCE to ask you to slow down.  Considering all this
is untested and LLM generated, I have even more doubts whether this
should be considered for review.

Please read kernel documentation BEFORE posting more work. It will
explain you how to identify subsystems, how to organize your work per
subsystem (so a patchset grouping multiple patches with a short cover
letter), how to document the issue discovery method and what was
or was not tested.

Best regards,
Krzysztof




