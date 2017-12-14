Return-Path: <bjorn.andersson@linaro.org>
Date: Wed, 13 Dec 2017 17:32:36 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 11/16] remoteproc: introduce
 rproc_find_carveout_by_name function
Message-ID: <20171214013236.GL17344@builder>
References: <1512060411-729-1-git-send-email-loic.pallardy@st.com>
 <1512060411-729-12-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1512060411-729-12-git-send-email-loic.pallardy@st.com>
To: Loic Pallardy <loic.pallardy@st.com>
Cc: ohad@wizery.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com, benjamin.gaignard@linaro.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu 30 Nov 08:46 PST 2017, Loic Pallardy wrote:
> +struct rproc_mem_entry *
> +rproc_find_carveout_by_name(struct rproc *rproc, char *name)

In almost all cases after this patch you have to do a snprintf(), so it
would be better to make this function format the name based on a format
string and variable arguments.

> +{
> +	struct rproc_mem_entry *carveout, *mem = NULL;
> +
> +	if (!name)
> +		return NULL;
> +
> +	list_for_each_entry(carveout, &rproc->carveouts, node) {
> +		/* Compare carveout and requested names */
> +		if (!strcmp(carveout->name, name)) {
> +			mem = carveout;
> +			break;
> +		}
> +	}
> +
> +	return mem;
> +}
> +

Regards,
Bjorn
