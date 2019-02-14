Return-Path: <andriy.shevchenko@linux.intel.com>
Date: Thu, 14 Feb 2019 15:11:16 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH V2 2/2] rpmsg: add syslog redirection driver
Message-ID: <20190214131116.GW9224@smile.fi.intel.com>
References: <1550124158-1111-1-git-send-email-xiaoxiang@xiaomi.com>
 <1550124158-1111-2-git-send-email-xiaoxiang@xiaomi.com>
 <20190214130940.GV9224@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190214130940.GV9224@smile.fi.intel.com>
To: Xiang Xiao <xiaoxiang781216@gmail.com>
Cc: rdunlap@infradead.org, gregkh@linuxfoundation.org, alexander.shishkin@linux.intel.com, ohad@wizery.com, bjorn.andersson@linaro.org, wendy.liang@xilinx.com, arnaud.pouliquen@st.com, kumar.gala@linaro.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Guiding Li <liguiding@pinecone.net>
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu, Feb 14, 2019 at 03:09:40PM +0200, Andy Shevchenko wrote:
> On Thu, Feb 14, 2019 at 02:02:38PM +0800, Xiang Xiao wrote:

> > +	/* append the message after '\n' to the buffer */
> 
> > +	if (copied != 0) {

Missed comment

if (copied)

> > +	}

-- 
With Best Regards,
Andy Shevchenko
