Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39E9365A1D;
	Wed, 11 Mar 2026 06:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773210402; cv=none; b=KkkrTxlbn+c9PstzbWpBaw0qkTUz5gsK29i+9n4o/CZMfn2SbX7hlj0ertarbvNApKef0Hp/1rxwsRrIdd94zCw2l6Uifp1p/JYdmJINQ+LNskdyoJARF4eF1s/pWMBwtVRtPX8QMwkJ8yHOuEpbUa06rcGy4IhAdG8tWn1Yq0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773210402; c=relaxed/simple;
	bh=ptSjoq4BNliCbt3hh0am3X1nM3VRLmyr/oLeHfI9i7c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sJu1NbtScE1JoOe5TBpJK7tfhfflZgm5ojmvst3bxOQ9s0DtjNMY/okIPNeqrOMZr1xKEoDXM6Rx9HZhruYE86ol8+TqYdvcru7+szLw6Ii8Cp2nghZ+V2GxN6z7ptkKhLtuqOcLR1vRpih/VgRmGMPXzSbKyFku2iheiZWTLUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lCFHscki; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lCFHscki"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01183C4CEF7;
	Wed, 11 Mar 2026 06:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773210401;
	bh=ptSjoq4BNliCbt3hh0am3X1nM3VRLmyr/oLeHfI9i7c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lCFHsckiUpsjUn3URn/UBwl8HxnBfZ9OqIYzDgwvEJ9mSG+KQkRhvi7hrkipcVTLm
	 rRX35P82TUo3PwpMHJQekAqNN7HRBtEWgF0ata49Sx4N1neYLZLGXOjBFTcQ05YvrM
	 bVNPTRi/KcsWL/rjOgiA06zt+lVFTfMZrMwtBiqrXXL8br27pBbKqAn9Uua4vomLD2
	 3kWBQeD8+q+jqiNLF/V+73N8inqD5c2N+eC9o2DNc/w4p9iWtfpJHvo1AwRZPiqEfn
	 VE8T7DMiRPv+JnQAkabnsLr9pVNhuWO5CaAwBewdqn/zmc1juruueWUAtffYmtdkIJ
	 vtIpsGun1Kitg==
Date: Wed, 11 Mar 2026 07:26:38 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Jingyi Wang <jingyi.wang@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Luca Weiss <luca.weiss@fairphone.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com, 
	trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/7] dt-bindings: remoteproc: qcom: Document pas for
 SoCCP on Kaanapali and Glymur platforms
Message-ID: <20260311-unique-daft-nightingale-584252@quoll>
References: <20260310-knp-soccp-v4-0-0a91575e0e7e@oss.qualcomm.com>
 <20260310-knp-soccp-v4-4-0a91575e0e7e@oss.qualcomm.com>
 <oqvq52az6iknhg4negqaprfsx5dfo527acoeas3tusqpqvak2c@wrdmsydyy6ns>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <oqvq52az6iknhg4negqaprfsx5dfo527acoeas3tusqpqvak2c@wrdmsydyy6ns>

On Wed, Mar 11, 2026 at 04:04:09AM +0200, Dmitry Baryshkov wrote:
> On Tue, Mar 10, 2026 at 03:03:20AM -0700, Jingyi Wang wrote:
> > Document the component used to boot SoCCP on Kaanapali SoC and add
> > compatible for Glymur SoCCP which could fallback to Kaanapali. Extend
> > the "qcom,smem-states", "qcom,smem-state-names" in the pas-common.
> > 
> > Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> > ---
> >  .../remoteproc/qcom,kaanapali-soccp-pas.yaml       | 154 +++++++++++++++++++++
> >  .../bindings/remoteproc/qcom,pas-common.yaml       |   6 +-
> >  2 files changed, 159 insertions(+), 1 deletion(-)
> 
> With all the changes to pas-common, what is being left in it? Would it

You need place for definition of properties - smd/glink-edge and
qcom,smem-states. The latter is actually not properly defined in one
place, becuse there are bindings having  it but not refencing
pas-common.

It can also define common order of interrupts, but as you pointed out
this does not work for this new device anymore.

> be easier to leave it as is for the traditional DSPs and copy necessary
> functionality into the soccp schema?

Best regards,
Krzysztof

