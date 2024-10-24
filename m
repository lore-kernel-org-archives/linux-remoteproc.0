Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B43F167DAC;
	Thu, 24 Oct 2024 16:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729788532; cv=none; b=WVUTAqiUP5og4NIyB7VrqB1MIvNVUhjKupU2kIpauizZ5IFquEDwzIDCMi/XOyvvjE1QYLaUdEBQobgKc++HGgErnnI1SJQ0IhnH3xErQ+qCgiuXuAxnL3pe5tS9u0AFtH0lpgWxGIO/GPZI3VloByWA6TT2zM5I/UbaBdzKHXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729788532; c=relaxed/simple;
	bh=LaYLWkO8yuCfO8X6eZ1a7AiJcXeGGIn3VLInYOF8AJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QYrACNA27NBAYHE6UAEpeMePrVQfV9m3M0s/VySj8AUguckVV4E1NZFzB6rnW1/j/KLFtuy84VE6Oe05qvrdcQ1I4KE18y/nsbRhvvLmhQ+cRYwg8jJ9HIzfbd03gjT7M4k/HyKDJbBG7zns9wITpBltRbWv7oNe0IqPwLoxm/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fb00uFPC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fb00uFPC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A9D1C4CEE3;
	Thu, 24 Oct 2024 16:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729788532;
	bh=LaYLWkO8yuCfO8X6eZ1a7AiJcXeGGIn3VLInYOF8AJ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fb00uFPCMIHg/CtcINPRFL0FSf0hZAsz2HJAaie4YFEi3U+CfnMbGk0jobrkAneEY
	 8HaDvnMsxo6F7qUWVDYWopMPfyHKIxTJoe6fWQHenxmRb+s33FSPMWqYvU7p3t9OHQ
	 O0qTNSLdLiB4dRc8cgEi6GtUJGC7zxDfiveOY0J6U+BO+pARFRxnJNnet2bu5lmDM+
	 kanb0AGwtFN6HB1SPxaUmwLf/eUdYBdKHW0sRSp8UqUfGiVsbCG2KZemcWr80ow9wg
	 SO/xXJmbuQLT+n3/w2Y2hy50DOkiTnXx+36zNaE0TiHx0vTkPsjL7jKP+tgByyabNG
	 OgSTKud6bv7Nw==
Date: Thu, 24 Oct 2024 11:48:51 -0500
From: Rob Herring <robh@kernel.org>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Conor Dooley <conor+dt@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org, sound-open-firmware@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: remoteproc: fsl,imx-rproc: add new
 compatible
Message-ID: <20241024164851.GA572386-robh@kernel.org>
References: <20241023162114.3354-1-laurentiumihalcea111@gmail.com>
 <20241023162114.3354-2-laurentiumihalcea111@gmail.com>
 <ub7yylef6qyztjtg3pciamg6jjznxh3ydlqsdcg2xcoxqngpi4@j5jlex4qukyz>
 <8a017e66-6d84-4bdf-8188-9ae3428b6d17@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8a017e66-6d84-4bdf-8188-9ae3428b6d17@gmail.com>

On Thu, Oct 24, 2024 at 01:47:53PM +0300, Laurentiu Mihalcea wrote:
> 
> 
> On 10/24/2024 10:45 AM, Krzysztof Kozlowski wrote:
> > On Wed, Oct 23, 2024 at 12:21:11PM -0400, Laurentiu Mihalcea wrote:
> >> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> >>
> >> Add new compatible for imx95's CM7 with SOF.
> >>
> >> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> >> ---
> >>  .../bindings/remoteproc/fsl,imx-rproc.yaml    | 58 +++++++++++++++++--
> >>  1 file changed, 53 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> >> index 57d75acb0b5e..ab0d8e017965 100644
> >> --- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> >> +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> >> @@ -28,6 +28,15 @@ properties:
> >>        - fsl,imx8qxp-cm4
> >>        - fsl,imx8ulp-cm33
> >>        - fsl,imx93-cm33
> >> +      - fsl,imx95-cm7-sof
> >> +
> >> +  reg:
> >> +    maxItems: 2
> >> +
> >> +  reg-names:
> >> +    items:
> >> +      - const: dram
> >> +      - const: mailbox
> > That's quite different programming model. Are you sure these are devices
> > from similar class/type?
> Yep, these are all Cortex-M cores. It's just that their usage differs quite a lot.
> >
> > Your big if:then: block suggests this could be separate binding.
> Ideally I would have wanted to place the compatible inside dsp/fsl,dsp.yaml as the
> programming model would have been more similar.
> 
> Unfortunately, these are different physical devices (HiFi DSP core vs CM core) even
> though they're all used for DSP purposes so I'm not sure this is entirely appropriate.

That doesn't matter too much. trivial-devices.yaml is a bunch of 
completely unrelated devices which happen to have the same binding. We 
could probably take that farther with things like trivial clock 
providers for example. 

Having 'reg' vs not is pretty clearly something that should be different 
binding.

> 
> Alternatively, if you think grouping these devices (i.e: those represented by the -dsp compatibles
> from fsl,dsp and the one represented by the compatible introduced here) under the same binding
> is alright we can just branch off from fsl,dsp and fsl,imx-rproc and create a new binding for
> these devices. I'm expecting this to be relatively clean as they have the same programming
> model.

If it's just add a compatible and nothing else somewhere, I'd do that. 
If it's more than that, then I'd make a new binding doc.

Rob
