Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA373A1A58;
	Wed, 29 Apr 2026 07:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777446149; cv=none; b=q9ljBu/OeOWgpYvDK9E1hLc9/0sDLZYxKsbALqSeUvX6n3CBB4F9XEx3pZkUm/cLicvZlL9C5QeB+F0i72D7CbY/teGC0cVWPTgMqKPZIPsLayu1DDFTOR2FXN6IWq6yy8t0+rgyXxBxDeMSc3/qZ9c1HdY+ot1t6kDW9Nyvzts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777446149; c=relaxed/simple;
	bh=TDYcUx8OQgj9Uxad30JFBu63FNL1GZSF2oHvXTdgigM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mThfB1DnO8Ca5o8mBecTn3o1ve2ZPR/Wf2NQKgNciBezOfM3bM0/bXnslEKK021sh7JkOLD/37ov6I6kQE8g3ZqZ59pOLakcQCl66sikqyiPp0kNpJVxrcMQYbV+ApY9OgeY9mKl/pu9OTW51i+z+dBJysuFL+ERgMj3o2Nlx7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lr05VTq1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lr05VTq1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D81BBC19425;
	Wed, 29 Apr 2026 07:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777446149;
	bh=TDYcUx8OQgj9Uxad30JFBu63FNL1GZSF2oHvXTdgigM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lr05VTq14P+oR216ZNSEeF3E6TkMcX922d7mdMyMQyNXsAJNeD4p4GRMH1+B0cjg6
	 BbLHHhsl96wYRVhooB+LvN0G9ke3TQ4f7BSES5CMdVvh6Gn2Msan+ZXKAmZSnp0tmj
	 YuEeEI25n1mfOgYmf5sO/chhvCizU/aAAfxMJf64a7L/VnbI+dfp4dm5wH9FLiYr6m
	 ms1i3uQjy7u8hl0pe7pqvskwzTV6ysWQtT6lTYa0P9G2HQFtBludQLb7EVT+EBEV5t
	 Y9s5R8Wq7MS1f5ZpjL+Klio8HuL9UKZyDk/++pH/llgEefI6/9JdgKRmehjCTMDI2/
	 ATMfptaIxFeCw==
Date: Wed, 29 Apr 2026 09:02:26 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ben Levinsky <ben.levinsky@amd.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org, 
	mathieu.poirier@linaro.org, linux-kernel@vger.kernel.org, michal.simek@amd.com, 
	tanmay.shah@amd.com
Subject: Re: [PATCH v3 1/2] dt-bindings: remoteproc: document AMD BRAM-based
 rproc
Message-ID: <20260429-hallowed-mighty-caterpillar-dfbfca@quoll>
References: <20260428142633.1854251-1-ben.levinsky@amd.com>
 <20260428142633.1854251-2-ben.levinsky@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260428142633.1854251-2-ben.levinsky@amd.com>

On Tue, Apr 28, 2026 at 07:26:32AM -0700, Ben Levinsky wrote:
> +          - enum:
> +              - xlnx,versal-bram-rproc
> +              - xlnx,versal-net-bram-rproc
> +              - amd,versal2-bram-rproc

If there is going to be a new version, this should be sorted by name.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

