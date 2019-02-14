Return-Path: <andriy.shevchenko@linux.intel.com>
Date: Thu, 14 Feb 2019 14:53:47 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH V2 1/2] lib/string: add memrchr function
Message-ID: <20190214125347.GU9224@smile.fi.intel.com>
References: <1550124158-1111-1-git-send-email-xiaoxiang@xiaomi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1550124158-1111-1-git-send-email-xiaoxiang@xiaomi.com>
To: Xiang Xiao <xiaoxiang781216@gmail.com>
Cc: rdunlap@infradead.org, gregkh@linuxfoundation.org, alexander.shishkin@linux.intel.com, ohad@wizery.com, bjorn.andersson@linaro.org, wendy.liang@xilinx.com, arnaud.pouliquen@st.com, kumar.gala@linaro.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Xiang Xiao <xiaoxiang@xiaomi.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu, Feb 14, 2019 at 02:02:37PM +0800, Xiang Xiao wrote:
> Here is the detailed description for memrchr:
> 
> void *memrchr(const void *s, int c, size_t n);
> 
> The memrchr() function is like the memchr() function, except
> that it searches backward from the end of the n bytes pointed
> to by s instead of forward from the beginning.
> 
> The memrchr() functions return a pointer to the matching byte
> or NULL if the character does not occur in the given memory
> area.

> +void *memrchr(const void *s, int c, size_t n)
> +{
> +	const unsigned char *p = s + n;
> +
> +	while (n-- != 0) {

Simple:

	while (n--) {

> +		if ((unsigned char)c == *--p)
> +			return (void *)p;
> +	}
> +	return NULL;
> +}

-- 
With Best Regards,
Andy Shevchenko
