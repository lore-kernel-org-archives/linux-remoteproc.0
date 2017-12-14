Return-Path: <bjorn.andersson@linaro.org>
Date: Wed, 13 Dec 2017 21:34:56 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 14/16] remoteproc: look-up pre-registered carveout by
 name for carveout allocation
Message-ID: <20171214053456.GO17344@builder>
References: <1512060411-729-1-git-send-email-loic.pallardy@st.com>
 <1512060411-729-15-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1512060411-729-15-git-send-email-loic.pallardy@st.com>
To: Loic Pallardy <loic.pallardy@st.com>
Cc: ohad@wizery.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com, benjamin.gaignard@linaro.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu 30 Nov 08:46 PST 2017, Loic Pallardy wrote:
> +	/* By name */
> +	mem = rproc_find_carveout_by_name(rproc, rsc->name);
> +	if (mem) {
> +		/*
> +		 * Update resource table with registered carevout information
> +		 */
> +		rsc->len = mem->len;

You should validate that len, da and pa are compatible.

> +		rsc->da = mem->da;
> +		rsc->pa = rproc_va_to_pa(mem->va);
> +		/* no need to register as already match one for one */
> +		return 0;
> +	}

Regards,
Bjorn
